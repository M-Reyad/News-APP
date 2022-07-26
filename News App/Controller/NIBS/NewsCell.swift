//
//  NewsCell.swift
//  News App
//
//  Created by Muhammad Reyadh on 7/24/22.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class NewsCell: UITableViewCell {
    
    //Cell Attributes//
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsTime: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    func config(with news: articles){
        //Configuring Image with ImageURL sent from API, in case found Nil, replace it with PlaceHolder Image Link//
        self.newsImage.sd_setImage(with: URL(string: news.urlToImage ?? K.placeholderImage)){ (_, error, _, _) in
            //Completion Handler to Handle Errors//
            if error != nil{
                print(error!)
            }
        }
        //Configuring the Rest of Attributes with default Values in Case of Found Nill
        //** In case Author Found Nil, replace it with Souce.Name **//
        //** In case Source.Name also found Nil, replace it with "No Source Found" **//
        self.newsAuthor.text = news.author ?? news.source.name ?? "No Source Found!"
        //In case found No Title, replace it with "No Title Found"
        self.newsTitle.text = news.title ?? "No Title Found!"
        //In case found No Content, replace it with "No Content Found"
        self.newsDescription.text = news.description ?? "No Content Found!"
        //In case found No Time, replace it with "Unknown Time"
        self.newsTime.text = news.publishedAt ?? "Unknown Time"
        
    }
    
    
    
}
