//
//  ViewController.swift
//  AJob
//
//  Created by Lisette Antigua on 2/10/22.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    var programVar:String?
@IBOutlet weak var signOutTitle: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = Auth.auth().currentUser?.email
        
        signOutTitle.title = "Sign Out"
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

  
}

 
