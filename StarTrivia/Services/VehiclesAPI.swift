//
//  VehiclesAPI.swift
//  StarTrivia
//
//  Created by Le Trung on 8/17/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import Foundation
import Alamofire

class VehiclesAPI {
    func getVehicle(url: String, completion: @escaping VehiclesResponseCompletion) {
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
                let vehicle = try jsonDecoder.decode(Vehicles.self, from: data)
                completion(vehicle)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
    }
}
