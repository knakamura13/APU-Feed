//
//  FeedViewController.swift
//  APU Feed
//
//  Created by Kyle Nakamura on 11/13/18.
//  Copyright © 2018 Kyle Nakamura. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: Properties
    
    private let refreshControl = UIRefreshControl()

    var allMessages: [FeedMessage] = []
    
    
    
    // MARK: View Loading and Appearing Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testUser = User(name: "Apple", profileImage: UIImage(named: "apple-logo-transparent")!)
        var testMessage = FeedMessage(creator: testUser, contents: "Hello from Apple!", image: UIImage(named: "apple-building")!)
        
        for i in 1 ... 9 {
            if i == 2 {
                testMessage.contents = "Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple!"
            } else if i == 5 {
                testMessage.contents = "Hello from Apple! Hello from Apple! Hello from Apple!"
            } else if i == 6 {
                testMessage.contents = "Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple! Hello from Apple!"
            }
            allMessages.append(testMessage)
        }
        
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red: 0.33, green: 0.66, blue: 0.77, alpha: 1.0) // APU Red
        refreshControl.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        refreshControl.attributedTitle = NSAttributedString(string: "Checking for new messages ...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.9)])
        refreshControl.layer.zPosition = -1
    }
    
    @objc private func refresh(_ sender: Any) {
        DispatchQueue.main.async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            })
        }
    }
    
    
    
    // MARK: TableView Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! FeedCell
        
        // Populate the cell's contents
        let item = allMessages[indexPath.row]
        cell.profileThumbnail.image = item.creator.profileImage
        cell.creatorNameLbl.text = item.creator.name
        cell.contentLbl.text = item.contents
        if let img = item.image {
            cell.contentImg.image = img
        }
        
        // Customize the cell's appearance
//        cell.profileThumbnail.layer.cornerRadius = 20.0
        cell.contentImg.layer.cornerRadius = 10.0
        
        return cell
    }
}
