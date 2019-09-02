//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Le Trung on 8/17/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var pxLbl: UILabel!
    @IBOutlet weak var capacityLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var person: Person!
    let api = StarshipsAPI()
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        nextBtn.isEnabled = starships.count > 1
        previousBtn.isEnabled = false
        guard let firstStarship = starships.first else { return }
        getStarship(url: firstStarship)
    }
    

    func getStarship(url: String) {
        spinner.startAnimating()
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.spinner.stopAnimating()
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starships) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        pxLbl.text = starship.passengers
        capacityLbl.text = starship.capacity
        ratingLbl.text = starship.rating
        
    }
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        getStarship(url: starships[currentStarship])
    }
}
