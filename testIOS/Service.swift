//
//  Service.swift
//  testIOS
//
//  Created by Miguel Orjuela on 12/26/21.
//  Copyright © 2021 Camilo Orjuela. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    
    func getMovies(completion: @escaping (Movies?) -> Void) {
        
        guard let url = URL(string: "http://localhost:3000/movies") else {
            
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                do {
                    let jsonSerialized = try JSONDecoder().decode(Movies.self, from: data)
                    
                    completion(jsonSerialized)
                    
                }  catch let error as NSError {
                    
                    print(error.localizedDescription)
                    completion(nil)
                }
            } else if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func getMoviesAlamofire(completion: @escaping (Movies?) -> Void) {
        
        AF.request("http://localhost:3000/movies").responseDecodable(of: Movies.self) { response in
            
            guard let movies = response.value else {
                completion(nil)
                return
            }
            
            completion(movies)
        }
    }
}
