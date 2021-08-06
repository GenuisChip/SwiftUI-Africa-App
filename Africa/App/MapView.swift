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
                
                // Custom Pin annotation (animated)
                MapAnnotation(coordinate: item.location){
                    MapAnnotationView(location: item)
                }
            }
        )
        .overlay(
            // Top Compass to show centered Coordinates
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 12, content: {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack (alignment: .leading,spacing: 3){
                    HStack( content: {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    })
                    Divider()
                    HStack( content: {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    })
                }
            })
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .background(Color.black)
            .opacity(0.6)
            .cornerRadius(8)
            .padding()
            ,alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
