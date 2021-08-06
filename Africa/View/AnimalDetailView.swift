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
                
                SubTitleWithIcon(
                    image: "photo.on.rectangle.angled",
                    title: "Wilderness in Picture"
                )
                
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
                
                
                Group{
                    SubTitleWithIcon(
                    image: "questionmark.circle",
                    title: "Did you Know"
                    )
                    GroupBox{
                        TabView{
                            ForEach(animal.fact, id:\.self){ item in
                                Text(item)
                            }
                        }.tabViewStyle(PageTabViewStyle())
                        .frame(minHeight: 140, idealHeight: 150, maxHeight: 160, alignment: .center)
                    }
                }
                
                    
                Group{
                    SubTitleWithIcon(
                        image: "info.circle",
                        title: "All about \(animal.name)"
                    )
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                    
                }.padding()
              
                SubTitleWithIcon(
                    image: "map",
                    title: "National Parks"
                )
                
                InsetMapView()
                
                Group{
                    SubTitleWithIcon(
                        image: "book",
                        title: "Learn More"
                    )
                    ExternalLinkWebView(animal: animal)
                }.padding(.horizontal)
                
                
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

struct SubTitleWithIcon: View {
    let image: String
    let title: String
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8, content: {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.title2)
        })
    }
}
