//
//  detailedViewController.swift
//  pixabay
//
//  Created by MacBook Pro on 05/11/2021.
//

import UIKit

class detailedViewController: UIViewController {

    @IBOutlet weak var detailedImg: UIImageView!
    var img : Hit?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        guard let imgurl = img?.largeImageURL else { return  }
        let url = URL(string: imgurl)!
        detailedImg.downloaded(url: url)
    }
}
