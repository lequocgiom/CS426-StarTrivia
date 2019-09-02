//
//  Constants.swift
//  StarTrivia
//
//  Created by Le Trung on 8/16/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"

let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseCompletion = (Person?)->Void
typealias HomeworldResponseCompletion = (Homeworld?)->Void
typealias VehiclesResponseCompletion = (Vehicles?)->Void
typealias StarshipsResponseCompletion = (Starships?)->Void
typealias FilmResponseCompletion = (Film?)->Void
