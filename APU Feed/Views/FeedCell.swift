//
//  FeedCell.swift
//  APU Feed
//
//  Created by Kyle Nakamura on 11/13/18.
//  Copyright © 2018 Kyle Nakamura. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var profileThumbnail: UIImageView!
    @IBOutlet weak var creatorNameLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var contentImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
