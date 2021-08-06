//
//  MapView.swift
//  Africa
//
//  Created by Ali Hassan on 8/5/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let location: [NationalParkLoaction] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(
            
            coordinateRegion: $region,
            annotationItems: location,
            annotationContent: {
                item in
                // 1- Pin : Old Style (static)
                // MapPin(coordinate: item.location, tint: .accentColor)
                
                //2- Pin : New Style (static)
                // MapMarker(coordinate: item.location, tint: .accentColor)
                
                // Custom Pin annotation
                MapAnnotation(coordinate: item.location){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                }
            }
            
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
