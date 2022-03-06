//
//  JobTableDetailsVC.swift
//  AJob
//
//  Created by Lisette Antigua on 3/6/22.
//

import UIKit

class JobTableDetailsVC: UIViewController {

    @IBOutlet weak var jAppLink: UILabel!
    @IBOutlet weak var jDescription: UITextView!
    @IBOutlet weak var jImage: UIImageView!
    @IBOutlet weak var jTitle: UILabel!
    
    var allJobs: ListOfJobs!
    var indexpath:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        jTitle.text = "\((allJobs.jobs[indexpath].name))"
        jDescription.text = "\((allJobs.jobs[indexpath].description))"
        
        jImage.image = ((allJobs.jobs[indexpath].image))
        
        jAppLink.text = "\((allJobs.jobs[indexpath].link))"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
