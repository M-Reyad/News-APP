//
//  NewsView.swift
//  News App
//
//  Created by Muhammad Reyadh on 7/24/22.
//

import UIKit
import SDWebImage

class NewsView: UICollectionViewCell {
    
    //View Attributes//
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsTime: UILabel!
    
    
    //Awake From Nib Func//
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Config Cell With News Func//
    func config(with news: articles){
        self.newsImage.sd_setImage(with: URL(string: String(news.urlToImage!)), completed: nil)
        self.newsTitle.text = news.title
        self.newsAuthor.text = news.author
        self.newsTime.text = news.publishedAt
        
        
    }

}
