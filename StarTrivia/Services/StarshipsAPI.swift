//
//  StarshipsAPI.swift
//  StarTrivia
//
//  Created by Le Trung on 8/17/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import Foundation
import Alamofire

class StarshipsAPI {
    func getStarship(url: String, completion: @escaping StarshipsResponseCompletion) {
        guard let url = URL(string: url) else {return}
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let starship = try jsonDecoder.decode(Starships.self, from: data)
                completion(starship)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
    }
}
