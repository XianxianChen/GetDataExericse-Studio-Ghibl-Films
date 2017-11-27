//
//  ViewController.swift
//  GetDataExericse-Studio-Ghibl-Films
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var films: [Film] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func loadData() {
        let urlStr = "https://ghibliapi.herokuapp.com/films"
        let filmOnline: ([Film]) -> Void = {(films: [Film]) in
            self.films = films
        }
        GhiblFilmAPIClient.manager.getFilms(from: urlStr, completionHandler: filmOnline, errorHandler: {print($0)})
    }

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "film cell", for: indexPath)
        cell.textLabel?.text = films[indexPath.row].title
        cell.detailTextLabel?.text = films[indexPath.row].release_date
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FilmDetailViewController {
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            let selectedFilm = films[selectedIndex]
            destination.film = selectedFilm
        }
    }
}

