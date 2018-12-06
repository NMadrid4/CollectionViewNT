//
//  HomeCollectionViewCell.swift
//  CollectionViewApp
//
//  Created by Melanie on 12/6/18.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            titleLabel.text = movie?.title
        }
    }
}
