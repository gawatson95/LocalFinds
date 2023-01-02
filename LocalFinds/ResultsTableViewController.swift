//
//  ResultsTableViewController.swift
//  LocalFinds
//
//  Created by Grant Watson on 12/31/22.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    var places = [Result]()
//    var results = ["BOK Center", "Vanguard", "Cain's Ballroom"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getPlaces { places in
            self.places = places
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        title = "Points of Interest"
        
        self.tableView.register(POICell.self as AnyClass, forCellReuseIdentifier: "POICell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name
//        cell.textLabel?.text = results[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tapped point of interest == go to detail screen
        let vc = DetailViewController()
        vc.poi = places[indexPath.row].name
        //vc.poi = results[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
