//
//  Network.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 04/11/22.
//

import Foundation

struct NetworkManager {
    func getMovies(url: String, completion: @escaping(MoviesGenericResponse?) -> ()) {
        guard let sessionURL = URL(string: url) else {return}
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: sessionURL) { (data, response, error) in
            if error == nil {
                if (response as? HTTPURLResponse)?.statusCode == 200 {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedData = try decoder.decode(MoviesGenericResponse.self, from: safeData)
                            completion(decodedData)
                        } catch {
                            print("error while parsing data \(error)")
                            completion(nil)
                        }
                    }
                }else{
                    completion(nil)
                    print("error code" )
                }
            }
            else {
                print("error in data task is \(String(describing: error))")
            }
        }
        dataTask.resume()
    }
    
    func getMovieDetail(url: String, completion: @escaping(MovieDetailResponse?) -> ()) {
        guard let sessionURL = URL(string: url) else {return}
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: sessionURL) { (data, response, error) in
            if error == nil {
                if (response as? HTTPURLResponse)?.statusCode == 200 {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedData = try decoder.decode(MovieDetailResponse.self, from: safeData)
                            completion(decodedData)
                        } catch {
                            print("error while parsing data \(error)")
                            completion(nil)
                        }
                    }
                }else{
                    completion(nil)
                    print("error code" )
                }
            }
            else {
                print("error in data task is \(String(describing: error))")
            }
        }
        dataTask.resume()
    }

}
