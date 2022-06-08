//
//  ImageTableViewController.swift
//  pixabay
//
//  Created by MacBook Pro on 11/10/2021.
//

import UIKit

class ImageTableViewController: UITableViewController, UISearchResultsUpdating{
        
    let searchController = UISearchController()
    let networkService = NetworkService()
    var hits: [Hit] = []
  
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = true
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        updateSearchResults(for: searchController)
     }
   func updateSearchResults(for searchController: UISearchController) {
      
        if let text = searchController.searchBar.text {
        searchController.obscuresBackgroundDuringPresentation = false
        networkService.getImages(query: text, operation: refreshView)
        }
    }
   func refreshView (hitsRefresh : [Hit]) {
       hits = hitsRefresh
       self.tableView.reloadData()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hits.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        let hit = hits[indexPath.row]
        let imageURLString = hit.largeImageURL
        let url = URL(string: imageURLString)
        cell.searchImageView.downloaded(url: url!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "selectedImage", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "detailedViewController") as? detailedViewController
        vc?.img = hits[indexPath.row]
         self.navigationController?.pushViewController(vc!, animated: true)
    }
}

