//
//  NetworkManager.swift
//  LocalFinds
//
//  Created by Grant Watson on 12/31/22.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    let headers = [
      "accept": "application/json",
      "Authorization": "fsq34UpTDGSJVMqjr0nwrPNSKTjXqF9SLU/FWvBx90EQLRo="
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?categories=10035&near=Tulsa%2C%20OK")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    
    func getPlaces(completion: @escaping ([Result]) -> ()) {
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let data = data else { return }
                print(response)
                
                if let places = try? JSONDecoder().decode(PlaceModel.self, from: data) {
                    print("COMPLETE")
                    completion(places.results)
                }
            }
        })
        
        dataTask.resume()
    }
    
    //func getPlaceDetails(fsqi: String, completion: @escaping ()
}
