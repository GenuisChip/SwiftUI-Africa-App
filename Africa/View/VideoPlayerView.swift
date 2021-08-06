//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Ali Hassan on 8/6/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let video: Video
    var body: some View {
        VStack {
            // NOTE : to play videos select the video file and open it's property tab and check on "Target MemberShip"
            VideoPlayer(
                player: playVideo(fileName: video.id, fileFormat: "mp4")
            ).overlay(
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height:32)
                .padding(.top,6)
                .padding(.horizontal, 8)
                ,
                alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(video.name,displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            VideoPlayerView(video: videos[0])
        }
    }
}
