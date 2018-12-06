//
//  ViewController.swift
//  CollectionViewApp
//
//  Created by Melanie on 12/6/18.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    let tableViewCellIdentifier = "Cell"

    var categorias: [Categoria] = [Categoria.init(title: "Comedia", movies:[Movie.init(id: 1, title: "wepldl", description: "WWW"),
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
        tableView.register(UINib(nibName: "HomeTableViewHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeTableViewHeader")
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    //MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categorias.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.categorias = categorias[indexPath.section]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableViewHeader") as! HomeTableViewHeaderView
        header.categoryNameLabel.text = categorias[section].title
        return header
    }
    
    
}

