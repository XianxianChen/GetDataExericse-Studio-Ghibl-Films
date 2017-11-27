//
//  GhiblFilmAPIClient.swift
//  GetDataExericse-Studio-Ghibl-Films
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class GhiblFilmAPIClient {
    static let manager = GhiblFilmAPIClient()
    private init() {}
   func getFilms(from urlStr: String,
                          completionHandler: @escaping ([Film]) -> Void,
                          errorHandler: @escaping (Error) -> Void) {
        guard let urlStr = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let film = try JSONDecoder().decode([Film].self, from: data)
                completionHandler(film)
            } catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: urlStr, completionHandler: completion, errorHandler: {print($0)})
    }
    
}
