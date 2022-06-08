//
//  ImageCell.swift
//  pixabay
//
//  Created by MacBook Pro on 25/10/2021.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var searchImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(true, animated: true)

    }
}
