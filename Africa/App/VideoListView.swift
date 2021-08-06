//
//  VideoListView.swift
//  Africa
//
//  Created by Ali Hassan on 8/5/21.
//

import SwiftUI

struct VideoListView: View {
    @State() var videos: [Video] = Bundle.main.decode("videos.json")
    //Haptic Feedback
    let hapticImpact = UIImpactFeedbackGenerator(style:.medium)
    
    var body: some View {
        NavigationView {
            List{
                ForEach(videos.shuffled()){ item in
                    NavigationLink(
                        destination: VideoPlayerView(video: item),
                        label: {
                            VideoListItemView(video: item)
                                
                        }).padding(.vertical, 8)
                }
            }
            .navigationBarTitle("Videos")
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            videos.shuffle()
                            hapticImpact.impactOccurred()
                        },
                        label: {
                            Image(systemName: "arrow.2.squarepath")
                        }
                    ))
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
