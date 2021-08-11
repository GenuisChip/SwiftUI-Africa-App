//
//  ContentView.swift
//  Africa
//
//  Created by Ali Hassan on 8/5/21.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State var isGridLayout: Bool = false
    @State var gridLayout: [GridItem] = [GridItem()]
    @State var gridIcon : String = "square.grid.2x2"

    
    
    
    func changeGridColumnLayout(){
        gridLayout = Array(repeating: GridItem(), count: gridLayout.count % 3 + 1)
        
        switch gridLayout.count {
        case 1 :
            gridIcon = "square.grid.2x2"
            break
        case 2 :
            gridIcon = "square.grid.3x2"
            break
        case 3 :
            gridIcon = "rectangle.grid.1x2"
            break
        default:
            gridIcon = "square.grid.2x2"
            break
        }
    }
    
    var body: some View {
        NavigationView{
            Group{
                if !isGridLayout {
                    List{
                        CoverImageView()
                            .frame( height: 300, alignment: .center)
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
                } else {
                    ScrollView{
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 16, content: {
                            ForEach(animals){item in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: item),
                                    label: {
                                        Image(item.id)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(8)
                                })
                            }
                        })
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    HStack (spacing : 16){
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(!isGridLayout ? .accentColor : .primary)
                            .onTapGesture {
                                isGridLayout = false
                            }
                        
                        Image(systemName: gridIcon)
                            .font(.title2)
                            .foregroundColor(isGridLayout ? .accentColor : .primary)
                            .onTapGesture {
                                isGridLayout = true
                                changeGridColumnLayout()
                            }
                    }
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
