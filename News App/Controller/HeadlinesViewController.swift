//
//  HeadlinesViewController.swift
//  News App
//
//  Created by Muhammad Reyadh on 7/24/22.
//

import Foundation
import UIKit
import WebKit
import SafariServices


class HeadlinesViewController: UIViewController{
    
    //View Controller Variables//
    var newsManager = NewsManager()
    var countries = [String]()
    var country = ""
    var articlesList = [articles]()
    var webView = WKWebView()
    
    //View Controller Attributes//
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var countryPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Conforming DataSource & Delegates//
        collectionView.dataSource = self
        collectionView.delegate = self
        countryPicker.dataSource = self
        countryPicker.delegate = self
        newsManager.delegate = self

        
        //Registering Nib//
        collectionView.register(UINib(nibName: K.newsView, bundle: nil), forCellWithReuseIdentifier: K.newsView)
        
        //Initial Country Reading and Running API//
        self.country = K.countriesList[countries[countryPicker.selectedRow(inComponent: 0)]]!
        self.newsManager.URLCreator(withNews: K.headLinesScreen, q: nil, withLanguage: nil, withCountry: self.country)
    
}
}
//MARK:- Collection View
extension HeadlinesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    //Returning number of Cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    //Configuring Cell Attributes//
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.newsView, for: indexPath) as! NewsView
        cell.config(with: articlesList[indexPath.row])
        print(cell)
        return cell
    }
    //Defining the Cell Dimensions//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 276 * K.conversionIndex
        let height = 300 * K.conversionIndex
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Initialize webView Frame with super view frame Size//
        webView.frame = super.view.safeAreaLayoutGuide.layoutFrame
        //Unwrapping URL//
        if let safeurl = articlesList[indexPath.row].url{
 
//Loading Using Safari Services **Comment in case WebKit is used**
            let vc = SFSafariViewController(url: URL(string: safeurl)!)
            present(vc, animated: true, completion: nil)
            
//Loading Using WebKit Services//
/*Uncomment all the below Lines and Comment all the Abovr Lines*/
//            webView.load(urlRequest)
//            //Presenting WebView//
//            view.addSubview(webView)
//            let urlRequest = URLRequest(url: URL(string: safeurl)!)

        }else{
            print("Error Unwrapping the URL!")
        }
            }
    
}
//MARK:- Picker View

extension HeadlinesViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    //Number of Picker Components is 1
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of Rows in the Component//
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //Looping to make Countries List from CountriesList Dictionary//
        for country in K.countriesList.keys{
            countries.append(country)
        }
        return countries.count
        
    }
    
    //Returning the Picker View Titles; Countries//
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    //Return the ISO-Country Codes in 2 Alpahbets to Country Label
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.country = K.countriesList[countries[row]]!
        //Running API
        newsManager.URLCreator(withNews: K.headLinesScreen, q: nil, withLanguage: nil, withCountry: self.country)
        
    }
}

//MARK:- News Manager Delegate
extension HeadlinesViewController: NewsManagerDelegate{
    func didFailToSearch() {
        print("failed")
    }
    
    func didFinishFetching(with articles: [articles]) {
        //Updating UI in async mode
        DispatchQueue.main.async {
            self.articlesList = articles
            self.collectionView.reloadData()
        }
    }
    
    
}
