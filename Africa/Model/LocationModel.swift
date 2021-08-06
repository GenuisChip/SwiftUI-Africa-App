//
//  LocationModel.swift
//  Africa
//
//  Created by Ali Hassan on 8/7/21.
//

import Foundation
import MapKit

struct NationalParkLoaction : Codable , Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
