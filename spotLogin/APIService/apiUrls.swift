//
//  apiUrls.swift
//  spotLogin
//
//  Created by Siddhesh Redkar on 2019-11-27.
//  Copyright © 2019 Siddhesh Redkar. All rights reserved.
//

import Foundation
import UIKit



var Live_IP = "http://surya-interview.appspot.com"





// post Methods //


func GetUserList() -> String {
    return Live_IP + "/list";
}

