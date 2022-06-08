//
//  API.swift
//  pixabay
//
//  Created by MacBook Pro on 11/10/2021.
//

import Foundation
struct APIResponse: Codable {
    let total : Int
    let totalHits : Int
    let hits : [Hit]
    
}
struct Hit: Codable {
    let id : Int
    let largeImageURL : String
   
}
