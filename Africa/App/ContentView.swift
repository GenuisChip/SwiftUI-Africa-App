//
//  ContentView.swift
//  Africa
//
//  Created by Ali Hassan on 8/5/21.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    var body: some View {
        NavigationView{
            List{
                
                CoverImageView()
                    .frame( height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .listRowInsets(
                        EdgeInsets(
                            top: 0, leading: 0, bottom: 0, trailing: 0
                        )
                    )
                
                ForEach(animals){item in
                    NavigationLink(
                        destination: AnimalDetailView(animal: item),
                        label: {
                            AnimalListItemView(animal: item)
                    })
                }
            }
            .navigationBarTitle("Africa",displayMode: .large)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
