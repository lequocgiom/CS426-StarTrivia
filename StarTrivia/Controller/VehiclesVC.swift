//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Le Trung on 8/17/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var pxLbl: UILabel!
    
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var person: Person!
    let api = VehiclesAPI()
    var vehicles = [String]()
    var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String) {
        spinner.startAnimating()
        api.getVehicle(url: url) { (vehicle) in
            self.spinner.stopAnimating()
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle: Vehicles) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        makerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        pxLbl.text = vehicle.passengers
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        
        getVehicle(url: vehicles[currentVehicle])
    }
}
