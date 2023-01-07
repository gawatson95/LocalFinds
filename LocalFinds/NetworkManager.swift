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
    
    func getPlaces(completion: @escaping ([PlaceID]) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?categories=10035")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let data = data else { return }
                
                let decoder = JSONDecoder()
                if let places = try? decoder.decode(Places.self, from: data) {
                    completion(places.results)
                }
            }
        })
        
        dataTask.resume()
    }
    
    func getPlaceDetails(fsqID: String, completion: @escaping (PlaceDetail) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/\(fsqID)?fields=fsq_id%2Cname%2Clocation%2Cdescription%2Ctel%2Cwebsite%2Cverified%2Chours%2Chours_popular%2Crating%2Cpopularity%2Cprice%2Cphotos")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if let error = error {
              print(error.localizedDescription)
          } else {
            
              let decoder = JSONDecoder()
              if let data = data {
                  do {
                      let details = try decoder.decode(PlaceDetail.self, from: data)
                      completion(details)
                  } catch {
                      print(error)
                  }
              }
          }
        })

        dataTask.resume()
    }
}
