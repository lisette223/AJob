//
//  JobTableViewController.swift
//  AJob
//
//  Created by Lisette Antigua on 3/5/22.
//

import UIKit
import Firebase


class MentorTableViewController: UITableViewController , UISearchBarDelegate{

    
    var mentors = [ListOfMentors]()
   
    var filteredMentors:[ListOfMentors]!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var jTable: UITableView!
    var tech = [ListOfMentors(type: "Technology", mentors: [Mentor(name: "Jane Smith", profession: "Programmer", jobDescription: "I am a computer programmer. My  duties include designing and updating software solutions, writing and updating source-code and managing various operating systems.\n\nPlace of Work: Apple", contactInfo:"Contact Info:abc@gmail.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-03 at 9.19.21 AM"))])]

   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 50
       // mentors.append(contentsOf:science)
        mentors.append(contentsOf:tech)
  
   
        searchBar.delegate = self
        
     
        filteredMentors = mentors
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
      
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "mentorList", sender: self)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return filteredMentors.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredMentors[section].mentors.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobslist", for: indexPath)
        
        
        let j = filteredMentors[indexPath.section].mentors[indexPath.row]
        //let announce2 = tourneys.section[indexPath.row]
       
        cell.textLabel?.text = j.name
        cell.detailTextLabel?.text = j.jobDescription + j.contactInfo
        
        
        cell.imageView?.image = j.image


        return cell
    }
    
    
    @IBAction func signOut(_ sender: Any) {
       
        // 1
        guard let user = Auth.auth().currentUser else { return }
       
          // 4
          do {
            try Auth.auth().signOut()
            self.navigationController?.popToRootViewController(animated: true)
          } catch let error {
            print("Auth sign out failed: \(error)")
          }
        }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let announce = filteredMentors[section]
        
        return announce.type
    }

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
          
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.font =  UIFont(name: "AppleSDGothicNeo-Thin", size: 30.0)
        lbl.textColor = UIColor.black
        //lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.text = filteredMentors[section].type
           view.addSubview(lbl)
           return view
         }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
    }
         
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 80
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? MentorViewController {
            destination.allJobs = filteredMentors[(jTable.indexPathForSelectedRow?.section)!]
            destination.indexpath = jTable.indexPathForSelectedRow?.row ?? 0
            jTable.deselectRow(at: jTable.indexPathForSelectedRow!, animated: true)
    }

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMentors = []
        
        if searchText == ""{
            filteredMentors = mentors
        }
        else{
            for (_, lj) in mentors.enumerated(){
            
                for(index,j) in lj.mentors.enumerated(){
                    if j.name.lowercased().contains(searchText.lowercased()){
                        var newLJ = lj
                        let newJ:Mentor = lj.mentors[index]
                        newLJ.mentors = [newJ]
                        filteredMentors.append(newLJ)
                       
                    }
                }
            }
        }
       
        self.tableView.reloadData()
    }
}
