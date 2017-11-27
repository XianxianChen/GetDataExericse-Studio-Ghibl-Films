//
//  GhiblFilm.swift
//  GetDataExericse-Studio-Ghibl-Films
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct Film: Codable{
    let title : String
    let director: String
    let description: String
    let release_date: String
    let producer: String
    static let defaultFilm = Film(title: "default", director: "Unknown", description: "Unknown", release_date: "Unknown", producer: "Unknown")
   
}
