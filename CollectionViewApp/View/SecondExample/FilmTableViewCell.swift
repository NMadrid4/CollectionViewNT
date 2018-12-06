//
//  FilmTableViewCell.swift
//  CollectionViewApp
//
//  Created by Melanie on 12/6/18.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmCollectionView: UICollectionView!
    var categoria: Categoria? {
        didSet {
            filmCollectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension FilmTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoria?.movies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as! FilmCollectionViewCell
        cell.movie = categoria?.movies[indexPath.row]
        return cell
    }
    
    
}
