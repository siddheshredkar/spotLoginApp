//
//  infoListViewController.swift
//  spotLogin
//
//  Created by Siddhesh Redkar on 2019-11-27.
//  Copyright © 2019 Siddhesh Redkar. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class infoListViewController: UIViewController {
    
    
    @IBOutlet weak var userInfoListTableView: UITableView!
    
    
    
  
    var emailId:String = ""
    var userInfo = [Item]()
    var UserInfoArray = ["firstName":String(),"lastName":String(),"emailId": String(),"imageUrl":String()]
    var UserInfoDict = [[String:Any]]()
    
    var UserListArray = NSArray()
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfoListTableView.delegate = self
        userInfoListTableView.dataSource = self
       
      
        
        if emailId == ""{
        loadFromLocal()
               }else{
        fetchData()
        }
       

       

        // Do any additional setup after loading the view.
    }
    
    
    
    func loadFromLocal(){
       
        UserListArray = UserDefaults.standard.array(forKey: "listOfUser") as NSArray? ?? []
        print(UserListArray)
        DispatchQueue.main.async {
                             self.userInfoListTableView.reloadData()
            
                              }
      
        
    }
    
    
    
   
    
    
      fileprivate func fetchData() {
        
       
            Service.shared.fetchCourses(emailId: emailId) { (courses, err) in
                       if let err = err {
                           print("Failed to fetch courses:", err)
                           return
                       }
                       
                       self.userInfo = courses?.items ?? []
                       print(self.userInfo[0])
                       
            self.CreateLocalDict()
                       DispatchQueue.main.async {
                           
                            self.userInfoListTableView.reloadData()
                       }
                       
                      
                   }
        
        
       
    }
    
    
    
    func CreateLocalDict(){
        for item in 0..<self.userInfo.count{
                     let fistName = self.userInfo[item].firstName
                     let lastName = self.userInfo[item].lastName
                     let emailId = self.userInfo[item].emailID
                     let imageUrl = self.userInfo[item].imageURL
            
                    self.UserInfoArray.removeAll()
                     self.UserInfoArray.updateValue(lastName ?? "", forKey: "lastName")
                     self.UserInfoArray.updateValue(fistName ?? "", forKey: "fistName")
                     self.UserInfoArray.updateValue(emailId ?? "", forKey: "emailId")
                     self.UserInfoArray.updateValue(imageUrl ?? "", forKey: "imageUrl")
        
                     self.UserInfoDict.append(self.UserInfoArray)
                             
                           }
//                 print(self.UserInfoDict)
      
        
                UserListArray = self.UserInfoDict as? NSArray ?? []
//         print(UserListArray)
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(self.UserListArray, forKey: "listOfUser")
        userDefaults.synchronize()
        
        
       
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


extension infoListViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableViewCell") as! infoTableViewCell
        
        let item = UserListArray[indexPath.row] as? NSDictionary
        cell.firstName.text = item?.value(forKey: "fistName") as? String ?? ""
        cell.lastName.text = item?.value(forKey: "lastName") as? String ?? ""
        cell.emailId.text = item?.value(forKey: "emailId")  as? String ?? ""
        let imageUrl = URL(string: item?.value(forKey: "imageUrl")  as? String ?? "")
        cell.userImage?.kf.indicatorType = .activity
        cell.userImage?.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named: "FACEBOOK_LINE-01-512")
           )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // as our image height is 100 fix
    }
    
    
}
