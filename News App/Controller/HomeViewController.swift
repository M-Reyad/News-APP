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
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    
    
    //View Controller Variables//
    var articlesList = [articles]()
    var lang = "en"
    var q : String?
    var newsManager = NewsManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Activity Indicator Stopping and Hiding//
        activityIndicator.stopAnimating()
        print("Stopped")
        activityIndicator.isHidden = true
        
        //Conforming DataSources & Delegates//
        tableView.dataSource = self
        tableView.delegate = self
        newsManager.delegate = self
        searchBar.delegate = self


        //Nib Registering//
        tableView.register(UINib(nibName: K.newsCell, bundle: nil), forCellReuseIdentifier: K.newsCell)
        
        
        
        
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
            //Activating Activity Indicator
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
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
            
            destinationVC.image.sd_setImage(with: URL(string: articlesList[index].urlToImage ?? K.placeholderImage), completed: { (image, error, _, _) in
                if error != nil{
                    print(error!)
                }
            })
            destinationVC.titl = articlesList[index].title ?? "No Title"
            destinationVC.time = articlesList[index].publishedAt ?? "Unknown"
            destinationVC.author = articlesList[index].author ?? articlesList[index].source.name!
            destinationVC.descr = articlesList[index].description ?? "No Content"
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}

//MARK:- Search Bar
extension HomeViewController: UISearchBarDelegate{
    //Pressing Search Button//
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //-1-ActivityIndicator Starting Animating
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        //-2- Adding Search Bar Content to q value //
        q = searchBar.text
        
        //-3- Searching the Articles Using News Manager re-creating URL//
        newsManager.URLCreator(withNews: K.everyThingScreen, q: q!, withLanguage: lang, withCountry: nil)
        
        //-4- Returning Search Bar to Empty//
        searchBar.text = ""
        
        //-5- Dismissing Keyboard//
        searchBar.endEditing(true)
        
    }
    
}

//MARK:- News Manager Delegate
extension HomeViewController: NewsManagerDelegate{
    func didFailToSearch() {
        
        DispatchQueue.main.async {
        //Deactivating Activity Indicator
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        
        //Presenting an Allert
        let alert = UIAlertController(title: "URL Error", message: "Search Can't be Completed with this Language or Empty Search Inputs!\n Type something in English and Switch Languages using the Above Selector!", preferredStyle: .alert)
        //Adding Action to the Allert
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
            self.present(alert,animated: true)
            alert.addAction(action)
    }
    }
    
    func didFinishFetching(with articles: [articles]) {
        //Modifying the Table View Content after Filling the Articles List//
        DispatchQueue.main.async {
            //Adding Results into Articles List
            self.articlesList = articles
            //Reloading TableView Data
            self.tableView.reloadData()
            //Deactivating Activity Indicator
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }

        
    }
    
}
