//
//  NewsView.swift
//  News App
//
//  Created by Muhammad Reyadh on 7/24/22.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class NewsView: UICollectionViewCell {
    //View Attributes//
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsTime: UILabel!
    
    
    //Awake From Nib Func//
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Config Cell With News Func//
    func config(with news: articles){
    
        self.newsImage.sd_setImage(with: URL(string: news.urlToImage ?? K.placeholderImage)){ (_, error, _, _) in
            //Completion Handler to Handle Errors//
            if error != nil{
                print(error!)
            }
        }
        
        self.newsTitle.text = news.title
        self.newsAuthor.text = news.author
        self.newsTime.text = news.publishedAt
        
    }

}
