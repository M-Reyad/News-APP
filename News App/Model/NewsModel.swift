//
//  NewsModel.swift
//  News App
//
//  Created by Muhammad Reyadh on 7/24/22.
//

import Foundation
import UIKit


struct hits: Codable{
    let articles : [articles]
}

struct articles: Codable {
    let source : source
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
    
}

struct source : Codable {
    let id : String?
    let name : String?
}


