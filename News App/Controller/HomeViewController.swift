//
//  ViewController.swift
//  News App
//
//  Created by Muhammad Reyadh on 7/24/22.
//

import UIKit
import NVActivityIndicatorView
import SDWebImage

class HomeViewController: UIViewController {
    
    //View Controller Attributes//
    
    @IBOutlet weak var lanuageSelector: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    //View Controller Variables//
    var articlesList = [articles]()
    var lang = "en"
    var q : String?
    var newsManager = NewsManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table View Delegate//
        tableView.dataSource = self
        tableView.delegate = self
        //Nib Registering//
        tableView.register(UINib(nibName: K.newsCell, bundle: nil), forCellReuseIdentifier: K.newsCell)
        //Search Bar Delegate//
        searchBar.delegate = self
        //NewsManager Delegate
        newsManager.delegate = self
        
        
        
    }
    
//MARK:- Language Selector Function//
    @IBAction func languageSelected(_ sender: Any) {
        
//Switching the Value of Language//
        switch lanuageSelector.selectedSegmentIndex {
        case 0:
            self.lang = "ar"
            print(self.lang)
            break
        case 1:
            self.lang = "en"
            print(self.lang)
            break
        case 2:
            self.lang = "fr"
            print(self.lang)
            break
        default:
            self.lang = "en"
            break
        }
        
//Check if the Search has no results yet//
        if q != nil{
            newsManager.URLCreator(withNews: K.everyThingScreen, q: q!, withLanguage: lang, withCountry: nil)
        }
        
    }
}



//MARK:- TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    //Number of cells//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    //Generating Table View Cells//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.newsCell) as! NewsCell
        //Configuring Cells as Nibs//
        cell.config(with: articlesList[indexPath.row])
        return cell
    }
    
    //Selecting A Cell to Open Details//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected index is \(indexPath.row)")
        performSegue(withIdentifier: K.articleSegue, sender: indexPath.row)
    }
    
    //Configuring the Details View Controller//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as! Int
        
        //Down Casting UIViewController Into Details View Controller//
        if let destinationVC = segue.destination as? DetailsViewController{
            
        //Configuring Details View Controller Attributes//
            destinationVC.author = articlesList[index].author ?? articlesList[index].source.name!
            destinationVC.descr = articlesList[index].description ?? "No Content"
            destinationVC.image.sd_setImage(with: URL(string: articlesList[index].urlToImage ?? K.placeholderImage), completed: { (image, error, _, _) in
                if error != nil{
                    print(error!)
                }
            })
            destinationVC.titl = articlesList[index].title ?? "No Title"
        }
        
    }
    

}

//MARK:- Search Bar
extension HomeViewController: UISearchBarDelegate{
    //Pressing Search Button//
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //-1- Adding Search Bar Content to q value //
        q = searchBar.text
        //-2- Searching the Articles Using News Manager re-creating URL//
        newsManager.URLCreator(withNews: K.everyThingScreen, q: q!, withLanguage: lang, withCountry: nil)
        //-3- Returning Search Bar to Empty//
        searchBar.text = ""
        //-4- Dismissing Keyboard//
        searchBar.endEditing(true)
        
    }
    
}

//MARK:- News Manager Delegate
extension HomeViewController: NewsManagerDelegate{
    func didFinishFetching(with articles: [articles]) {
        //Modifying the Table View Content after Filling the Articles List//
        DispatchQueue.main.async {
            self.articlesList = articles
            self.tableView.reloadData()
        }
    }
    
}
