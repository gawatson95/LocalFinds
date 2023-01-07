//
//  ResultsTableViewController.swift
//  LocalFinds
//
//  Created by Grant Watson on 12/31/22.
//

import UIKit

class HomeVC: UITableViewController {
    
    var placeDetails = [PlaceDetail]()
    //var placeDetails = ["BOK Center", "Vanguard", "Cain's Ballroom"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getPlaces { places in
            
            for place in places {
                NetworkManager.shared.getPlaceDetails(fsqID: place.fsqID) { details in
                    self.placeDetails.append(details)
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.tableView.reloadData()
                print(self.placeDetails)
            }
        }
        
        title = "Points of Interest"
        
        self.tableView.register(POICell.self as AnyClass, forCellReuseIdentifier: "POICell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeDetails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
        cell.textLabel?.text = placeDetails[indexPath.row].name
        //cell.textLabel?.text = placeDetails[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = placeDetails[indexPath.row]
        let vc = DetailViewController()
        vc.poi = place.name
        vc.placeDetails = place
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
