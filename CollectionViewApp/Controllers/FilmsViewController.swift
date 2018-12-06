//
//  FilmsViewController.swift
//  CollectionViewApp
//
//  Created by Melanie on 12/6/18.
//

import UIKit

class FilmsViewController: UIViewController {
    
    @IBOutlet weak var resizableView: UIView!
    @IBOutlet weak var highlightsCollectionView: UICollectionView!
    @IBOutlet weak var filmsTableView: UITableView!
    @IBOutlet weak var resizableHeightConstant: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var filmsHigh = ["film1","film2"]
    var categorias: [Categoria] = [Categoria.init(title: "Comedia", movies:[Movie.init(id: 1, title: "wepldl", description: "WWW"),
                                                                            Movie.init(id: 2, title: "dsadsad", description: "WWW2")]),
                                   Categoria.init(title: "Comedia", movies:[Movie.init(id: 1, title: "wepldl", description: "WWW"),
                                                                            Movie.init(id: 2, title: "dsadsad", description: "WWW2")]),
                                   Categoria.init(title: "Comedia", movies:[Movie.init(id: 1, title: "wepldl", description: "WWW"),
                                                                            Movie.init(id: 2, title: "dsadsad", description: "WWW2")]),
                                   Categoria.init(title: "Ficción", movies:[Movie.init(id: 1, title: "TITLE1", description: "WWW"),
                                                                             Movie.init(id: 2, title: "2TITLE1", description: "WWW2")]),
                                   Categoria.init(title: "Documentales", movies: [Movie.init(id: 3, title: "jeje", description: "WWW"),
                                                                                  Movie.init(id: 3, title: "1jeje", description: "WWW"),
                                                                                  Movie.init(id: 3, title: "21jeje", description: "WWW"),
                                                                                  Movie.init(id: 3, title: "41jeje", description: "WWW"),
                                                                                  Movie.init(id: 4, title: "jeejj", description: "WWW2")])]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filmsTableView.register(UINib(nibName: "FilmTableViewHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "FilmTableViewHeader")
        self.scrollView.isScrollEnabled = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if categorias.count > 2 {
            self.scrollView.isScrollEnabled = true
        }
        resizableHeightConstant.constant = resizableHeightConstant.constant + CGFloat(categorias.count * 188) - self.filmsTableView.frame.height
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension FilmsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmTableViewCell
        cell.categoria = categorias[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FilmTableViewHeader") as! FilmTableViewHeaderView
        header.categoryLabel.text = categorias[section].title
        return header
    }
}

extension FilmsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmsHigh.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HighlightCollectionViewCell
        cell.highlightImageView.image = UIImage(named: filmsHigh[indexPath.row])
        return cell
    }
    
    
}
