//
//  FilmDetailViewController.swift
//  GetDataExericse-Studio-Ghibl-Films
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {
    var film: Film?
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let theFilm = film {
            self.titleLabel.text = theFilm.title
            self.directorLabel.text = "Director: \(theFilm.director)"
            self.producerLabel.text = "Producer: \(theFilm.producer)"
            self.airDateLabel.text = "Release Date: \(theFilm.release_date)"
            self.textView.text = theFilm.description
        }
        // Do any additional setup after loading the view.
    }

 
    

  

}
