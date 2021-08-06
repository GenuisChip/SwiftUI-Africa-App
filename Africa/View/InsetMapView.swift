//
//  InsetMapView.swift
//  Africa
//
//  Created by Ali Hassan on 8/6/21.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var regoin = MKCoordinateRegion(
        center:
            CLLocationCoordinate2D(
                latitude: 6.600286, longitude: 16.4377599
            ),
        span:
            MKCoordinateSpan(
                latitudeDelta: 60.0, longitudeDelta: 60.0
            )
    )
    
    var body: some View {
        Map(coordinateRegion: $regoin)
            .overlay(
                NavigationLink(
                    destination: MapView(),
                    label: {
                        HStack{
                            Image(systemName: "mappin.circle")
                                .imageScale(.large)
                        
                            Text("Locations")
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal,14)
                        .background(
                            Color.black.opacity(0.4)
                                .cornerRadius(9)
                        )
                    }).padding(),
                alignment: .topTrailing
            )
            .frame(height:256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
    }
}
