//
//  ViewController.swift
//  insta_clone
//
//  Created by bany on 09/02/2022.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      self.handleNotAuthenticated()
   }
   
   private func handleNotAuthenticated() {
      
      if Auth.auth().currentUser == nil {
         let loginViewController = LoginViewController()
         
         loginViewController.modalPresentationStyle = .fullScreen
         present(loginViewController, animated: false, completion: nil)
      }
   }
 
}

