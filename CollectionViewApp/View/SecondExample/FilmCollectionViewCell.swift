//
//  FilmCollectionViewCell.swift
//  CollectionViewApp
//
//  Created by Melanie on 12/6/18.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filmNameLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            filmNameLabel.text = movie?.title
        }
    }
}
