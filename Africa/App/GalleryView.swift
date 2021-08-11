//
//  GalleryView.swift
//  Africa
//
//  Created by Ali Hassan on 8/5/21.
//

import SwiftUI

struct GalleryView: View {
    
    @State var columnsNumber = 3.0
    @State var selectedItem : Animal?
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            VStack(spacing: 20){
                
                Image("\(selectedItem?.id ?? "lion")")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                
                Slider(value: $columnsNumber, in: 1...4, step: 1)
                    .padding(.horizontal,24)
                
                LazyVGrid(
                    columns: Array.init(repeating: GridItem(), count: Int(columnsNumber)),
                    alignment: .center,
                    spacing: 20,
                    content: {
                        ForEach(animals){item in
                            Image(item.id)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white,lineWidth: 1))
                                .onTapGesture {
                                    selectedItem = item
                                }
                            
                    }
                })
            }.animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
