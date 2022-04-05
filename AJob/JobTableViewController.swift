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
        ListOfJobs(type: "Fast Food", jobs: [Jobs(name: "Burger King", description: "Team Member($8-$57 per hour): A Team Member is required to demonstrate an ability to interact with customers in relation to processing and preparing orders, solving complaints or other issues, receiving payments, and operating the cash register or POS terminal.\nShift Coordinator($10-$15 per hour): Responsibilities consist of providing training and assistance to staff members during an assign shift, monitors accurate and well-organized preparation of meals, and ensures complete satisfaction for customers.\nGeneral Manager($11-$13 per hour): The role of a General Manager comprises of managing human resources, as well as an ability to meet financial and operational objectives.", requirements: "Team Member: Must be at least sixteen(16) years of age. Comfortable working in a fast paced environment. Ability to interact in a positive and professional manner with guests and coworkers. Willingness to learn all areas of restaurant operations & work multiple stations. Available to work evenings, weekends and holidays.\nShift Coordinator: Must be at least eighteen (18) years of age. High School Diploma or GED required, 2 years of college preferred.1-2 years of previous quick service restaurant experience. Demonstrated understanding of guest service principles. Available to work evenings, weekends and holidays. Ability to work long and/or irregular shifts as needed, for proper functioning of the restaurant.\nGeneral Manager: Must be at least eighteen (18) years of age. High School Diploma or GED required, 2 years of college preferred. 1-2 years of previous restaurant management experience. Strong understanding of P&L management & drivers of restaurant profitability. Ability to prioritize own and others' work and time to meet deadlines and objectives. Demonstrated leadership skills. Demonstrated understanding of guest service principles. Available to work evenings, weekends and holidays. Ability to work long and/or irregular shifts as needed, for proper functioning of the restaurant", link: "https://careers.bk.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.24.39 AM")),Jobs(name: "McDonalds", description: "Crew Person($9-$16 per hour): Crew members are divided into Kitchen Crew, Counter Crew, and Maintenance Crew.\nCashier($6-$24 per hour): You are willing to stand for long period of hours during your shift. You have a very good mathematical skills and can operate cash register well.\nShift Manager($15-$20 per hour): Manages people, product and equipment to execute outstanding food quality, customer service, and restaurant cleanliness.", requirements: "Crew Person: All you'll need is an outstanding attitude, willingness to learn and grow and the capability to excel in a fast-paced, team environment. We'll teach you the rest. For job openings on your schedule - part time or full time - give us a try. You must be 14 years of age or older to work as a Crew Member at McDonald's.\nCashier: Essential qualifications for the job are customer focus, proactivity, teamwork, vigilance, good numeracy skills, and effective communication. Successful resumes make display of a high school or general education diploma. You must be 14 years of age or older to work as a Cashier at McDonalds's.\nShift Manager: Fast Track Management Program is available based on experience. We’re looking for positive team players with a flexible schedule who like to have fun, with the passion to work the famously fast paced McDonald’s environment. You must be 18 years or older to be a manager in our corporate owned and operated restaurants.", link: "https://careers.mcdonalds.com/us", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.24.00 AM")), Jobs(name: "Wendy's", description: "Crew Member($4-$17 per hour): You will be in charge of taking orders from the customer, process and package them in quick service.\nShift Supervisor($8-$26 per hour): You are responsible to train and supervise crew members, monitor the shift schedule, reinforce food safety standards and procedures.\nAssistant Manager($11-$21 per hour): Your main responsibility is to assist the General Manager in all aspects of managing, operating and staffing a Wendy’s restaurant", requirements: "Crew Member: At least 16 years of age. Have a reliable transportation. Perform physical demands of the job - including, but not limited to, standing for long periods of time and lifting up to 50 pounds.\nShift Supervisor: At least 16 years of age. At least 6 months to 1 year of supervisor or management experience in food service. Quick-service / Fast Food or Fast-casual experience. Be punctual, attentive to detail, friendly, willing to learn, reliable, and above all – honest. Reliable transportation, including for late night hours. Ability to work a variety of shifts. Ability to work both independently and as a member of a team. An impressive work-ethic. Desire to learn and gain experience. Must have a great personality, desire to serve guests, and enjoy working as part of a team, and be upbeat and engaging. Strong interpersonal, verbal communication skills. Must be able to multi-task.\nAssistant Manager: At least 16 years of age. Minimum of 1 year of restaurant management experience REQUIRED. QSR or Fast-casual experience, preferred but not required. Comfortable working in an emerging-growth company environment. Ability to work both independently and as a member of a team. An impressive work-ethic. Desire to learn industry/gain experience. Highly collaborative nature. Must have a great personality, desire to serve guests, and enjoy working as part of a team, and be upbeat and engaging. Strong interpersonal, verbal and written communication skills; Must be able to multi-task. Provide leadership, direction, and motivation to our team, while demonstrating a 'Can Do' attitude.", link: "https://wendys-careers.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.23.25 AM")), Jobs(name:"Taco Bell", description: "Team Member - Cashier & Food Prep($8-$12 per hour): Your responsibilities include greeting customers in the restaurant or drive-thru, taking and ringing up orders, handling payment and thanking customers.\nShift Manager($8-$18 per hour): The shift lead role provides a training ground for restaurant management.\nAssistant Manager($11-$17 per hour): Key responsibilities include making sure Team Members and Shift Managers complete all assigned duties, inventory management, and financial accountability and serve safe, quality food in a friendly manner.", requirements: "Team Member - Cashier & Food Prep: Must be 16 years old, some franchise requires 18 years old of age. Possess all documents and permits required by state & federal law. Must have reliable transportation to/from work. Open /flexible work availability. Results oriented and customer focused. Previous customer service work experience helpful.\nShift Manager: Must be at least 18 years old. Must pass background check criteria and drug test. Must have reliable transportation. Able to do basic business math. Able to stock shelves and coolers. Able to oversee and manage subordinate employees and provide direction. Able to sweep and mop floors, dust shelves and lift and carry out trash containers and place in an outside bin. Able to clean the parking lot and grounds surrounding the restaurant. Able to tolerate standing, walking, lifting up to 50 lbs. and stooping during 90% of shift time.\nAssistant Manager: Must be 18 years of age or older. Must have restaurant management experience. Demonstrate that customer needs are the highest priority. Follow cash control & security procedures, maintain inventory, manage labor, review financial reports, grown sales and take appropriate action in these area’s when necessary. Professionally interact with Human Resources, accounting & payroll departments. Must be able to pass a background check. Must be able to assist in lifting 40 to 50 lb. boxes in the store when necessary.", link: "https://jobs.tacobell.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-04 at 9.22.45 AM")), Jobs(name: "Subway", description: "Sandwich Artist($8-$12 per hour): The Sandwich Artist greets and serves guests, prepares product, maintains food safety and sanitation standards, and handles or processes light paperwork. Exceptional guest service is a major component of this position.\nShift Manager($9-$16 per hour): The Shift Manager supervises the operations of a shift to ensure that food safety, product preparation, cleanliness and inventory control standards are maintained.  This may include scheduling and supervising staff. Exceptional customer service is a major component of this position.\nAssistant Manager($8-$13 per hour): The Assistant Manager supervises restaurant staff and daily operations to ensure that food safety, product preparation, cleanliness and inventory control standards are maintained.", requirements: "The general minimum age requirement for Subway employees is 16 in most of the states. However, there are some states that allow 15-year-olds to work with a permit./nSandwich Artist: High school diploma or equivalent. You must be able to work in various working shifts either weekdays or weekends. Hard working and willingness to learn new things are the key factors to be accepted in this position. No past experience is required.\nShift Manager: High school diploma or equivalent. Experience in restaurant operations, preferably with supervisory experience. Requires excellent communication skills, ability to deal with all levels of team members.\nAssistant Manager: Ability to read, write, speak and understand English. Job requires bending, standing, and walking the entire workday. Basic math skills (addition, subtraction, division and multiplication). Ability to show patience and articulate well during the training of new employees Ability to lift 10 lbs frequently and up to 50 lbs occasionally", link: "https://apply.mysubwaycareer.com/us/en/careers/", image: #imageLiteral(resourceName: "Screen Shot 2022-03-03 at 9.21.59 AM"))])]
    var retail = [
        ListOfJobs(type: "Retail", jobs: [Jobs(name: "Target (Department Store)", description: "Assets Protection Team Leader/Target Protection Specialist/Assets Protection Specialist($10-$14 per hour): Assist in sustaining a hazard-free and sanitary outlet. Must also help keep thievery and fraudulent activity at a minimum.\nStore Facility Technician($23 per hour): Take charge of the aesthetic appeal of the store as well as the promotion of a safe environment for shopping/working.\nFood Service Team Member/Starbucks Team Member($10-$14 per hour): Must be in compliance with food safety regulations. In control of the making and serving quality food/beverages.\nCashier / Service Desk / Cart Attendant Team Member($15 per hour): Manage customer complaints with professionalism as well as helps maintain the appearance of the store.\nBakery/Deli/Meat/Produce Team Member & Cake Decorator($13-$18 per hour): Concentrate on preparing fresh, quality food and picking the right groceries. Highlight appearance and quality while providing outstanding customer service.\nHuman Resources Team Leader/Human Resources Team Member($11.44 per hour): Provide training and mentorship to other employees and walk potential employees through the hiring cycle.\nBackroom Team Member/Merchandise Flow Team Member/Reverse Logistics Team Member($12.86 per hour): In charge of stocking and restocking products for customers. Also responsible for customer and employee inquiries.\nPharmacy Team Member/Pharmacy Technician/Pharmacy Student($11-$25 per hour): Assist in filling prescriptions for pharmacists and take care of customer data with complete privacy and precision.\nPrice Accuracy Team Member/Presentation Team Member/Signing Team Member($9-$15 per hour): Manage price accuracy via labeling, tickets and store signs. Address customer complaints courteously and expeditiously.\nSales Floor Team Member/Fitting Room Team Member($15 per hour): Assist customers with their requests while upholding cleanliness and neatness throughout the store.\nSales Floor Team Leader/Backroom Team Leader/Guest Services Team Leader($18 per hour): Manage a fast-paced, exciting and enthusiastic team. Mentor your team members and monitor them.", requirements: "Before you apply: You must be at least 16 years old to apply for a Target store job. You must be at least 18 years old to apply for a Target Distribution Center Job. You must be able to provide proof of legal aurthorization to work in the United States.\nWhat You Need: Your Social Securty Number. Permanent address and contact information. Information about your education. Information about your employment experience. Ability to start within 60 days from today.", link: "https://jobs.target.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.20.42 AM")),Jobs(name: "Walgreens (Drug Store)", description: "Beauty Advisor($9.57 per hour): The beauty advisor at Walgreens provides customers with efficient, fast, courteous, and friendly information and cosmetic service, and maintains inventories, department records, and appearance of the store.\nService Clerk($9-$16 per hour): Models and delivers a distinctive and delightful customer experience. Registers sales on assigned cash register, provides customers with courteous, fair, friendly, and efficient checkout service.\nReset and Revision Clerk($10-$12 per hour): Responsibilities include pricing signage, completing product resets, knowing store layout to promote efficient resets, and mastering knowledge of store products.", requirements: "In order to comply with federal child labor laws, some stores set a minimum age requirement of sixteen years old for entry-level workers. Management positions and jobs in the pharmacy still require individuals to be between 18 years and 21 years of age. Academic certificates and previous work experience are unnecessary when applying for Most entry-level jobs. Additional qualifications and employment requirements vary by store location.", link: "https://jobs.walgreens.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.27.56 AM")), Jobs(name: "Walmart (Department Store)", description: "Store Associates($10.86 per hour): Workers falling under the job title of sales associate take responsibility for greeting customers, locating products, price-checking items, and organizing store shelves and displays.\nFresh Food Associate($14.77 per hour): These include detailed cleaning of the shelves and department, checking and maintaining temperature control, verifying dates, and disposing of lesser quality food products.\nStocker($15.33 per hour): A Walmart stocker is an entry-level job that involves unloading shipments and placing products in designated store areas. Other duties may include organizing backroom spaces, constructing displays, and at times assisting customers.\nCart Attendant($11.20 per hour): You are responsible for ensuring members see a well-kept parking lot which includes helping members with their purchases, and ensure there are carts ready and available.\nCashier($12.29): Primary roles include scanning coupons, applying discounts, processing payments, and ringing up sales on computerized cash registers. Cashiers also take responsibility for handling returns and answering questions about merchandise, store policies, and ongoing promotions.", requirements: "As a minimum age requirement, you must be at least 16 years old to work at Walmart. Certain positions, however, require a minimum age of 18. As you prepare to complete your application have your prior work history available.", link: "https://careers.walmart.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.21.58 AM")), Jobs(name: "Best Buy (Department Store)", description: "Cashier($9-$12 per hour): cashiers greet guests, ring up purchases, scan coupons, highlight sales and special discounts, pitch Best Buy rewards programs, and answer questions about products, services, and merchandise. Applicants must possess basic mathematics and computer skills.\nAsset Protection Specialist($10-$18 per hour): Asset Protection Associate coaches and leads employees in asset protection best practices to ensure a safe, secure and profitable environment throughout the store. They work with the Asset Protection Lead to resolve any hazards or compliance issues and investigate any accidents.\nComputer Technician($11-$24 per hour): Have experience with a number of different opertating systems. Those include all versions of Windows and Apple MacOS. You must also be able to troubleshoot all OS and Internet connection issues, whilst also being able to diagnose hardware and software issues. You will also be expected to quickly and efficiently install software, as well as hardware devices such as video and sound cards, modems, printers, cameras, and more.\n Sales Associate($8-$16 per hour): A Best Buy Sales Associate position represents a great opportunity for entry-level job seekers and relatively experienced workers alike. Sales associates primarily work in a retail environment and help customers find the right product.", requirements: "You will need to be at least 16 years of age and have a minimum of 3 month experience in either Asset Protection or customer service. You must be a minimum of 16 years old and have experience with a number of different operating systems.", link: "https://jobs.bestbuy.com/bby", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.21.21 AM")), Jobs(name: "Journeys (Shoe Store)", description: "Sales Associate($7-$15 per hour): Complete all assigned tasks and responsibilities promptly. Maintain store appearance and stockroom organization. Stay informed of current fashion trends. Complete all required training. Provide a fun, full service experience to all customers.\nBilingual Customer Service Representative($14-$16 per hour): responsible for providing excellent customer service and sales support for stores, in-store customers, and online customers resolving all customer service issues to satisfactory resolution. MUST have ability to speak Spanish and English, FLUENTLY.", requirements: "Minimum age to work at Journeys is 16 years old. Those over the age of 16 may fill out a Journeys job application form. Previous experience is not necessary to apply, online or in-store. Personal information, work experience, references, education/training, and other sections are required [ex: Referall source, personal inquiries, permission to work, and applicant statement])", link: "https://www.journeys.com/careers/stores", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.14.03 AM")), Jobs(name: "Barnes & Noble (Book Store)", description: "Bookseller($11.16 per hour): Works in every area of the store. They assist customers on the floor, check out customers at the registers, work in the music and kids department, arrange displays, and stock the shelves.\nReceiver($11 per hour): Works in the back stock and makes sure that the books/boxes are processed correctly and inventoried correctly.\nCafé Server($8-$17 per hour: Responsible for selling by providing exceptional customer service in the Caf through our caf service standards.", requirements: "You must be at least 16 years old to work at Barnes & Noble. If you are 16 or 17 years old, you may also need working papers. Please check with your state department of labor for details about the minimum age requirement to obtain working papers. Thank you.", link: "https://careers.barnesandnoble.com", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.20.13 AM")), Jobs(name: "Famous Footwear (Shoe Store)", description: "Sales/Stock Associate($12 per hour): Shoe Sales Associates help customers find the right pair.\nAssistant Sales Manager($13.43 per hour):", requirements: "cdscds", link: "cdscdscds", image: #imageLiteral(resourceName: "Screen Shot 2022-03-01 at 9.12.43 AM"))])]
                                        
  
                                                      
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
