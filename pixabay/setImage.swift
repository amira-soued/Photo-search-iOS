//
//  NukeExtension.swift
//  pixabay
//
//  Created by MacBook Pro on 11/11/2021.
//
import UIKit
import Foundation
import Nuke

extension UIImageView {
    func downloaded (url: URL) {
        
        Nuke.loadImage(with: url, into: self)
  }
}
