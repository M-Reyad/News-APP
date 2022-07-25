//
//  DetailsViewController.swift
//  News App
//
//  Created by Muhammad Reyadh on 7/24/22.
//

import UIKit


class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    //View Controller Attributes//
    var author: String?
    var titl: String?
    var time: String?
    var image = UIImageView()
    var descr: String?
    var link: String?
    
    
    //View Controller Labels//
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleTime: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Configuring View Controller
        self.config()
        print("Configures Successfully")
    }

    //Configuring View Controller Labels//
    func config() {
        self.articleAuthor.text = self.author
        self.articleBody.text = self.descr
        self.articleImage.image = self.image.image
        self.articleTime.text = self.time
        self.articleTitle.text = self.titl
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: false) {
            print("Dismissed")
        }
    }
    
    
}
