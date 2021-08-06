//
//  ExternalLinkWebView.swift
//  Africa
//
//  Created by Ali Hassan on 8/6/21.
//

import SwiftUI

struct ExternalLinkWebView: View {
    let animal:Animal
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Image(systemName:"arrow.up.right.square")
                    Link(
                        destination: URL(string:animal.link)!,
                        label: { Text(animal.name) }
                    )
                }.foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalLinkWebView_Previews: PreviewProvider {
    static let animal:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalLinkWebView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
