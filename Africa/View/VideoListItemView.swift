//
//  VideoListItemView.swift
//  Africa
//
//  Created by Ali Hassan on 8/6/21.
//

import SwiftUI

struct VideoListItemView: View {
    var video: Video
    var body: some View {
        Group{
            HStack (alignment: .top, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                ZStack {
                    Image(video.id)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 100, maxHeight:  90 )
                        .cornerRadius(8)
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                }
                VStack (alignment: .leading, spacing: 8, content: {
                    Text(video.name)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.accentColor)
                        
                    Text(video.headline)
                        .font(.footnote)
                })
            })
        }
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
