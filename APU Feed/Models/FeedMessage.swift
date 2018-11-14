//
//  FeedMessage.swift
//  APU Feed
//
//  Created by Kyle Nakamura on 11/13/18.
//  Copyright © 2018 Kyle Nakamura. All rights reserved.
//

import Foundation
import UIKit

struct FeedMessage {
    var creator: User!
    var contents: String!
    var image: UIImage?
    
    init(creator: User, contents: String, image: UIImage?) {
        self.creator = creator
        self.contents = contents
        self.image = image
    }
}
