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
        ListOfJobs(type: "Fast Food", jobs: [Jobs(name: "Burger King", description: "Team Member: A Team Manager is required to demonstrate an ability to interact with customers in relation to processing and preparing orders, solving complaints or other issues, receiving payments, and operating the cash register or POS terminal.\n Shift Coordinator: Responsibilities consist of providing training and assistance to staff members during an assign shift, monitors accurate and well-organized preparation of meals, and ensures complete satisfaction for customers. \n General Manager: The role of a General Manager comprises of managing human resources, as well as an ability to meet financial and operational objectives.", requirements: "Team Member: Must be at least sixteen(16) years of age. Comfortable working in a fast paced environment. Ability to interact in a positive and professional manner with guests and coworkers. Willingness to learn all areas of restaurant operations & work multiple stations. Available to work evenings, weekends and holidays.\n Shift Coordinator: Must be at least eighteen (18) years of age. High School Diploma or GED required, 2 years of college preferred.1-2 years of previous quick service restaurant experience. Demonstrated understanding of guest service principles. Available to work evenings, weekends and holidays. Ability to work long and/or irregular shifts as needed, for proper functioning of the restaurant.\n General Manager: Must be at least eighteen (18) years of age. High School Diploma or GED required, 2 years of college preferred. 1-2 years of previous restaurant management experience. Strong understanding of P&L management & drivers of restaurant profitability. Ability to prioritize own and others' work and time to meet deadlines and objectives. Demonstrated leadership skills. Demonstrated understanding of guest service principles. Available to work evenings, weekends and holidays. Ability to work long and/or irregular shifts as needed, for proper functioning of the restaurant", link: "https://careers.bk.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.24.39 AM")),Jobs(name: "McDonalds", description: "Crew Person: Crew members are divided into Kitchen Crew, Counter Crew, and Maintenance Crew.\n Cashier: You are willing to stand for long period of hours during your shift. You have a very good mathematical skills and can operate cash register well. \n Shift Manager: Manages people, product and equipment to execute outstanding food quality, customer service, and restaurant cleanliness.", requirements: "Crew Person: All you'll need is an outstanding attitude, willingness to learn and grow and the capability to excel in a fast-paced, team environment. We'll teach you the rest. For job openings on your schedule - part time or full time - give us a try. You must be 14 years of age or older to work as a Crew Member at McDonald's.\n Cashier: Essential qualifications for the job are customer focus, proactivity, teamwork, vigilance, good numeracy skills, and effective communication. Successful resumes make display of a high school or general education diploma. You must be 14 years of age or older to work as a Cashier at McDonalds's. Shift Manager: ", link: "https://careers.mcdonalds.com/us", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.24.00 AM")), Jobs(name: "Wendy's", description: "Crew Member: You will be in charge of taking orders from the customer, process and package them in quick service. \n Shift Supervisor: You are responsible to train and supervise crew members, monitor the shift schedule, reinforce food safety standards and procedures. \n Assistant Manager: Your main responsibility is to assist the General Manager in all aspects of managing, operating and staffing a Wendy’s restaurant", requirements: "sjdsd", link: "https://wendys-careers.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.23.25 AM"))])]
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
        
        if let destination = segue.destination as? JobTableDetailsVC {
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
