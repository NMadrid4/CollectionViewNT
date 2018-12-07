//
//  HomeTableViewCell.swift
//  CollectionViewApp
//
//  Created by Melanie on 12/6/18.
//

import UIKit
import AVKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var categorias: Categoria? {
        didSet {
            collectionView.reloadData()
        }
    }
    
}

extension HomeTableViewCell: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorias?.movies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.movie = categorias?.movies[indexPath.row]
        return cell
    }
    

}
