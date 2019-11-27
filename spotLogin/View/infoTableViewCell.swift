//
//  infoTableViewCell.swift
//  spotLogin
//
//  Created by Siddhesh Redkar on 2019-11-27.
//  Copyright © 2019 Siddhesh Redkar. All rights reserved.
//

import UIKit

class infoTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var userImage: UIImageView!
       @IBOutlet weak var firstName: UILabel!
       @IBOutlet weak var lastName: UILabel!
       @IBOutlet weak var emailId: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
