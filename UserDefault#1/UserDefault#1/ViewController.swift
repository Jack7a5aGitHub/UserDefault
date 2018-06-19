//
//  ViewController.swift
//  UserDefault#1
//
//  Created by Jack Wong on 2018/06/19.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saveToUserDefaults(lat: "lat2", long: "long2", address: "Osaka")
        retrievePlace()
    }

}

extension ViewController: PlaceDelegate {
    func saveToUserDefaults(lat: String, long: String, address: String) {
        var placesArray: [Place] = []
        placesArray.append(Place(lat: lat, long: long, address: address))
        let placesData = NSKeyedArchiver.archivedData(withRootObject: placesArray)
        UserDefaults.standard.set(placesData, forKey: "places")
    }
    
    func retrievePlace() {
        
        guard let placesData = UserDefaults.standard.object(forKey:"places") as? NSData else {
            print("Nothing found")
            return
        }
        
        guard let placesArray = NSKeyedUnarchiver.unarchiveObject(with: placesData as Data) as? [Place] else {
            print("Could not unarchieve from placesData")
            return
        }
        
        for place in placesArray {
            print("")
            print("Latitude: \(place.latitude)")
            print("Longitude: \(place.longitude)")
            print("Address: \(place.address)")
        }
    }
    
    
}
