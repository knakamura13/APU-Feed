//
//  FeedViewController.swift
//  APU Feed
//
//  Created by Kyle Nakamura on 11/13/18.
//  Copyright © 2018 Kyle Nakamura. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    // MARK: Properties
    
    private let refreshControl = UIRefreshControl()
    
    /// An array of FeedMessages to populate the UITableView.
    var allMessages: [FeedMessage] = []
    
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: Actions
    
    @IBAction func userProfileImageTapped(_ sender: Any) {
        self.userSelected()
    }
    
    @IBAction func userNameLabelTapped(_ sender: Any) {
        self.userSelected()
    }
    
    @IBAction func messageImageTapped(_ sender: Any) {
        self.messageImageSelected()
    }
    
    
    
    // MARK: View Loading and Appearing Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeAppearance()
        self.populateTestMessages()
    }
    
    
    
    // MARK: Custom Functions
    
    /**
     Populate the UITableView with placeholder information.
    */
    func populateTestMessages() {
        let testUser = User(name: "Apple", profileImage: UIImage(named: "apple-logo-transparent")!)
        
        let hello = "Hello from Apple!"
        for i in 0...9 {
            var testMessage = FeedMessage(creator: testUser, contents: "", image: UIImage(named: "apple-building")!)
            for _ in 0...i {
                testMessage.contents.append(contentsOf: hello)
                testMessage.contents += " "
            }
            allMessages.append(testMessage)
        }
    }
    
    /**
     Customize the attributes of the SuperView and its SubViews to modify appearance or behavior.
    */
    func customizeAppearance() {
        // Add Refresh Control to Table View
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refreshControl.tintColor = UIColor(red: 0.33, green: 0.66, blue: 0.77, alpha: 1.0) // APU Red
        refreshControl.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        refreshControl.attributedTitle = NSAttributedString(string: "Checking for new messages ...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.9)])
        refreshControl.layer.zPosition = -1
    }
    
    /**
     This function is called when the UIRefreshControl is activated.
     */
    @objc private func refresh() {
        DispatchQueue.main.async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            })
        }
    }
    
    /**
     This function is called when a user taps on the user profile image or user name at the top of a FeedCell.
    */
    func userSelected() {
        
    }
    
    /**
     This function is called when a user taps on the ContentImageView in a FeedCell.
     */
    func messageImageSelected() {
        
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
        cell.profileThumbnail.layer.cornerRadius = CGFloat(cell.profileThumbnail.frame.width)/2.0
        cell.contentImg.layer.cornerRadius = 10.0
        
        return cell
    }
}
