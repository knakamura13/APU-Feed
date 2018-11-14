//
//  User.swift
//  APU Feed
//
//  Created by Kyle Nakamura on 11/13/18.
//  Copyright © 2018 Kyle Nakamura. All rights reserved.
//

import Foundation
import UIKit

struct User {
    var name: String!
    var profileImage: UIImage!
    
    init(name: String, profileImage: UIImage?) {
        self.name = name
        self.profileImage = profileImage
    }
}
