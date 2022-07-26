//
//  NewsManager.swift
//  
//
//  Created by Muhammad Reyadh on 7/24/22.
//

import Foundation

protocol NewsManagerDelegate {
    func didFinishFetching(with articles: [articles])
    func didFailToSearch()
    
}

struct NewsManager {
    var baseURL = "https://newsapi.org/v2/"
    let apiKey = "&apiKey=44a64d70ded84eaabd9b94e07fa0176b"
    var country : String?
    var q : String?
    let everyThing = "everything?"
    let headLines = "top-headlines?"
    let sort = "&sortBy=publishedAt"
    
    var delegate: NewsManagerDelegate?
    
    var newsList: [articles] = []
    
    
    func URLCreator(withNews: String, q: String?, withLanguage: String?, withCountry: String?){
        var url = ""
        //Everything Fetching//
        if withNews == K.everyThingScreen {
            print(withNews)
            url = baseURL + everyThing + "q=\(q!)&language=\(withLanguage!)" + apiKey + sort
            print(url)
            
        }else{
        //Headlines Fetching//
            print(withNews)
            url = baseURL + headLines + "country=\(withCountry!)" + apiKey + sort
            print(url)
        }
        fetchNews(with: url)
    }
    
    //Fetch News Func//
    func fetchNews(with url: String){
        //1- Create URL
        if let safeURL = URL(string: url){
        //-2- Create URLSession
            let session = URLSession(configuration: .default)
        //-3- Give URL Session Task
            let task = session.dataTask(with: safeURL) { (data, response, error) in
                if error != nil {
                    
                    print("found error!\(error!)")
                    self.delegate?.didFailToSearch()
//                    return
                    
                }
                if let safeData = data{
                    self.parseJSON(with: safeData)
                }
            }
        //-4- Resuming the Task
            task.resume()
        }else{
            print("Error URL!")
            self.delegate?.didFailToSearch()
        }

    }
    
    //Parsing JSON into Hits Model//
    func parseJSON(with Data: Data){
        do{
            let decodedData = try JSONDecoder().decode(hits.self, from: Data)
            print(decodedData.articles.count)
            self.delegate?.didFinishFetching(with: decodedData.articles)

        }catch{
            print("Found Error!! \(error)")
            self.delegate?.didFailToSearch()
            
        }
        
}

}
