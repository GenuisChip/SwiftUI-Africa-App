//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Ali Hassan on 8/7/21.
//

import SwiftUI

struct MapAnnotationView: View {
    var location : NationalParkLoaction
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .onAppear{
            withAnimation(
                Animation.easeOut(duration: 2)
                    .repeatForever(autoreverses: false)){
                        animation = 1
                    }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [NationalParkLoaction] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: locations[0])
    }
}
