//
//  Place.swift
//  UserDefault#1
//
//  Created by Jack Wong on 2018/06/19.
//  Copyright © 2018 Jack Wong. All rights reserved.
//

import Foundation

protocol PlaceDelegate: class {
    func saveToUserDefaults(lat: String, long: String, address: String)
    func retrievePlace()
}

class Place: NSObject, NSCoding {
    var latitude: String
    var longitude: String
    var address: String
    
    init(lat: String, long: String, address: String ) {
        self.latitude = lat
        self.longitude = long
        self.address = address
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.latitude = aDecoder.decodeObject(forKey: "latitude") as? String ?? ""
        self.longitude = aDecoder.decodeObject(forKey: "longitude") as? String ?? ""
        self.address = aDecoder.decodeObject(forKey: "address") as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(latitude, forKey: "latitude")
        aCoder.encode(longitude, forKey: "longitude")
        aCoder.encode(address, forKey: "address")
    }
}
