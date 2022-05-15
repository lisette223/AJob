//
//  InternshipTableViewController.swift
//  AJob
//
//  Created by Lisette Antigua on 5/12/22.
//

import Foundation
//
//  JobTableViewController.swift
//  AJob
//
//  Created by Lisette Antigua on 3/5/22.
//

import UIKit
import Firebase


class InternshipTableViewController: UITableViewController , UISearchBarDelegate{

    
    var jobs = [ListOfJobs]()
   
    var filteredJobs:[ListOfJobs]!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var jTable: UITableView!
    
    var science = [ListOfJobs(type: "Science", jobs: [Jobs(name: "Biomedical Research Intern", description: "The OITE also offers a wide range of summer high school activities including lectures featuring distinguished NIH investigators, career/professional development workshops, college readiness activities, and Summer Poster Day", requirements: "High school applicants who will be 17 on June 15, 2021, and would like to request a waiver of the requirement that, at the time of application, they live within 40 miles of the NIH campus at which they hope to intern, should check the HS-SIP FAQs for guidance on requesting a waiver of this requirement", link: "https://sipsnow.com/job/national-institutes-of-health-bethesda-md-30-summer-internships-in-biomedical-research-for-high-school-students/?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic", image: #imageLiteral(resourceName: "channels4_profile"))])]
    var tech = [ListOfJobs(type: "Technology", jobs: [Jobs(name: "Tech Intern", description: "The intern will be assigned related roles for their field on programs or special projects consistent with the level of education and experience of the individual candidate", requirements: "Current high school student who will complete their senior year by Spring 2022 and will be 18 years of age", link: "https://jobs.baesystems.com/global/en/job/71825BR/Tech-Intern-High-School-Summer-2022?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic", image: #imageLiteral(resourceName: "Screen Shot 2022-05-15 at 6.56.12 PM"))])]
var engineering = [ListOfJobs(type: "Engineering", jobs: [Jobs(name: "Engineering Intern", description: "An intern in this position will work closely with a team of engineers in a technical application area such as military aircraft avionics, mission systems, sensor subsystems or mail handling systems, unmanned vehicles, mission planning, simulation or automation", requirements: "Candidates that have a strong desire to engage, and understand the fundamentals of engineering are encouraged to apply", link: "https://tarta.ai/j/ihbbFIABCr2uuunQM35O-engineering-high-school-intern-in-new-york-ny-at-lockheed-martin?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic", image: #imageLiteral(resourceName: "mKdx6PgL_400x400.jpg"))])]
    //var math = [ListOfJobs(type: "Mathematics", jobs: [Jobs(name: "", description: "", requirements: "", link: "", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.24.00 AM"))])]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 50
        jobs.append(contentsOf:science)
        jobs.append(contentsOf:tech)
        jobs.append(contentsOf:engineering)

       // jobs.append(contentsOf:math)
        searchBar.delegate = self
        
     
        filteredJobs = jobs
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
      
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return filteredJobs.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredJobs[section].jobs.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobslist", for: indexPath)
        
        
        let j = filteredJobs[indexPath.section].jobs[indexPath.row]
        //let announce2 = tourneys.section[indexPath.row]
       
        cell.textLabel?.text = j.name
        cell.detailTextLabel?.text = j.description + j.requirements
        
        
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
        let announce = filteredJobs[section]
        
        return announce.type
    }

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
          
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.font =  UIFont(name: "AppleSDGothicNeo-Thin", size: 30.0)
        lbl.textColor = UIColor.black
        //lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.text = filteredJobs[section].type
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
        
        if let destination = segue.destination as? InternshipViewController {
            destination.allJobs = filteredJobs[(jTable.indexPathForSelectedRow?.section)!]
            destination.indexpath = jTable.indexPathForSelectedRow?.row ?? 0
            jTable.deselectRow(at: jTable.indexPathForSelectedRow!, animated: true)
    }

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         filteredJobs = []
        
        if searchText == ""{
            filteredJobs = jobs
        }
        else{
            for (_, lj) in jobs.enumerated(){
                //j.jobs[i].name.lowercased().contains(searchText.lowercased()){
                //jobs[0].jobs[0].name
                //jobs[0].jobs[1].name
                //jobs[1].jobs[0].name
                //jobs[1].jobs[1].name
                //jobs[i].jobs[i].name
                for(index,j) in lj.jobs.enumerated(){
                    if j.name.lowercased().contains(searchText.lowercased()){
                        var newLJ = lj
                        let newJ:Jobs = lj.jobs[index]
                        newLJ.jobs = [newJ]
                        filteredJobs.append(newLJ)
                       
                    }
                }
            }
        }
       
        self.tableView.reloadData()
    }
}
