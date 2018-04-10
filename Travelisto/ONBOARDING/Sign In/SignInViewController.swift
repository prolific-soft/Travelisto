//
//  SignInViewController.swift
//  Travelisto
//
//  Created by Chidi Emeh on 1/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: Segue.signInToTabBar.rawValue, sender: nil)
    }
    

    //self.navigationController?.popViewController(animated: true)

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
