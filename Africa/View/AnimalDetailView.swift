//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Ali Hassan on 8/6/21.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height:5)
                            .offset(y:20)
                    )
                
                Text(animal.headline)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8, content: {
                    Image(systemName: "photo.on.rectangle.angled")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Wilderness in Picture")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                })
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 13, content: {
                        ForEach(animal.gallery , id:\.self){ image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:200)
                                .cornerRadius(8)
                        }
                    })
                    
                })
            })
            
        })
        .navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[2])
        }.previewDevice("iPhone 11 Pro")
    }
}
