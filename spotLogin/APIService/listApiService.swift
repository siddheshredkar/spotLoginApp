//
//  listApiService.swift
//  spotLogin
//
//  Created by Siddhesh Redkar on 2019-11-27.
//  Copyright © 2019 Siddhesh Redkar. All rights reserved.
//

import Foundation
import Alamofire


class Service: NSObject {
    
     
    
    static let shared = Service()
    
    func fetchCourses(emailId:String,completion: @escaping (UserInfo?, Error?) -> ()) {
        
         
                let baseUrl = GetUserList()
                                     
                  let queryStringParam  =  ["":""]
                    
                  var urlComponent = URLComponents(string: baseUrl)!
                  let queryItems = queryStringParam.map  { URLQueryItem(name: $0.key, value: $0.value as? String) }
                  urlComponent.queryItems = queryItems
                                          
                  let bodyParameters = ["emailId": emailId]
                                        
                  let authtok:String = ""
                                       
                                                
                   let headers = ["Content-Type": "application/json",
                                  "transactionId":"a",
                                  "Authorization":authtok]
                                        
                                
                 var request = URLRequest(url: urlComponent.url!)
                                          request.httpMethod = "POST"
                                          request.httpBody = try? JSONSerialization.data(withJSONObject: bodyParameters)
                                          request.allHTTPHeaderFields = headers
                                          
                 AF.request(request).responseJSON { response in
                // print(response)
                         // check response
                         
                         guard let data = response.data else { return }
                         do {
                             let courses = try JSONDecoder().decode(UserInfo.self, from: data)
                            
                            
//                            print(courses.items)
                            
                             DispatchQueue.main.async {
                                 completion(courses, nil)
                             }
                         } catch let jsonErr {
                             print("Failed to decode:", jsonErr)
                         }

                                                   
                                                          
                 }
     
       
           
     }
}
