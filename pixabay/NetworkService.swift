//
//  NetworkService.swift
//  pixabay
//
//  Created by MacBook Pro on 12/11/2021.
//

import Foundation
import UIKit
class NetworkService {
    func getImages(query: String, operation: @escaping ([Hit])-> Void) {
    let urlstring = "https://pixabay.com/api/?key=23573579-3ce9dffce018c6a2c3a9527df&q=\(query)&image_type=photo&per_page=20"
    guard let url = URL(string: urlstring) else {
        print("there was an error")
        return
    }
    let task = URLSession.shared.dataTask(with: url) { (data: Data?,_, error: Error? ) in
        do {
            let jsonData = try Data(contentsOf: url)
            let jsonResult = try JSONDecoder().decode(APIResponse.self, from: jsonData)
            
            DispatchQueue.main.async {
                operation(jsonResult.hits)
               
            }
        } catch {
            print(error)
        }
    }
    task.resume()
  }
}
