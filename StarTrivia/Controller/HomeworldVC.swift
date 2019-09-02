//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Le Trung on 8/17/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var person: Person!
    let api = HomeworldAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        api.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            self.spinner.stopAnimating()
            if let homeworld = homeworld {
                self.setupUI(homeworld: homeworld)
            }
        }
    }
    
    func setupUI(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }

}
