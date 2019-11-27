//
//  loginViewController.swift
//  spotLogin
//
//  Created by Siddhesh Redkar on 2019-11-27.
//  Copyright © 2019 Siddhesh Redkar. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var emailIdTf: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        checkLogin()
        setupButton()
        hideKeyboardTapAround()
        // Do any additional setup after loading the view.
    }
    
    
    private func setupButton (){
          
         
          loginBtn.tintColor = UIColor.white
          loginBtn.backgroundColor = view.tintColor
          loginBtn.layer.cornerRadius = 8
          loginBtn.layer.masksToBounds = true
      }
    
    
    func checkLogin(){
        if UserDefaults.standard.bool(forKey: "login") == true{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "infoListViewController") as? infoListViewController
                   vc?.emailId = ""
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    @IBAction func loginBtnPress(_ sender: Any) {
        
        
        guard let idStr = emailIdTf.text , !idStr.isEmpty else{
                   emailIdTf.placeholder = "Empty Field"
                  // print("EMP ID blank")
                   return
               }
        
       let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "infoListViewController") as? infoListViewController
        vc?.emailId = emailIdTf.text ?? ""
        self.navigationController?.pushViewController(vc!, animated: true)
        UserDefaults.standard.set(true, forKey: "login")
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
