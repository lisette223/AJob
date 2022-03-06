//
//  JobTableViewController.swift
//  AJob
//
//  Created by Lisette Antigua on 3/5/22.
//

import UIKit

class JobTableViewController: UITableViewController , UISearchBarDelegate{

    
    var jobs = [ListOfJobs]()
   
    var filteredJobs:[ListOfJobs]!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var jTable: UITableView!
    var fastFood = [
        ListOfJobs(type: "Fast Food", jobs: [Jobs(name: "Burger King", description: "Test", requirements: "sjdsd", link: "dksads", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.24.39 AM")),Jobs(name: "McDonalds", description: "Test", requirements: "sjdsd", link: "dksads", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.24.00 AM"))])]
    var retail = [
        ListOfJobs(type: "Retail", jobs: [Jobs(name: "Target", description: "Test", requirements: "sjdsd", link: "dksads", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.20.42 AM")),Jobs(name: "Walgreens", description: "Test", requirements: "sjdsd", link: "dksads", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.27.56 AM"))])]
                                        
  
                                                      
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 50
        jobs.append(contentsOf:fastFood)
        jobs.append(contentsOf:retail)
        
   
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
        cell.detailTextLabel?.text = j.description
        
        
        cell.imageView?.image = j.image


        return cell
    }
    
    
 
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let announce = jobs[section]
        
        return announce.type
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
        
        if let destination = segue.destination as? JobTableDetailsVC {
            destination.allJobs = jobs[(jTable.indexPathForSelectedRow?.section)!]
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
            for (i, j) in jobs.enumerated(){
                if j.jobs[i].name.lowercased().contains(searchText.lowercased()){
                    filteredJobs.append(j)
                    
                    print(i)
                }
            }
        }
       
        self.tableView.reloadData()
    }
}
