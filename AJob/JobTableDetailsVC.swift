//
//  JobTableDetailsVC.swift
//  AJob
//
//  Created by Lisette Antigua on 3/6/22.
//

import UIKit
import Firebase

class JobTableDetailsVC: UIViewController, UITextViewDelegate {

  
    @IBOutlet weak var jLinkTextView: UITextView!
    
    @IBOutlet weak var jDescription: UITextView!
    @IBOutlet weak var jImage: UIImageView!
    @IBOutlet weak var jTitle: UILabel!
    
    var allJobs: ListOfJobs!
    var indexpath:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        jTitle.text = "\((allJobs.jobs[indexpath].name))"
        jDescription.text = "\((allJobs.jobs[indexpath].description)) \n\n \((allJobs.jobs[indexpath].requirements))"
        
        jImage.image = ((allJobs.jobs[indexpath].image))
        
        navigationItem.title = Auth.auth().currentUser?.email

        
        let attributedString = NSMutableAttributedString(string: "Click here to apply")
        attributedString.addAttribute(.link, value: "\((allJobs.jobs[indexpath].link))", range: NSRange(location: 0, length: "Click here to apply".count))
        jLinkTextView.textAlignment = .center
        jLinkTextView.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            UIApplication.shared.open(URL)
            return false
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
