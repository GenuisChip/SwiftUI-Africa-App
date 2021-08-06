//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Ali Hassan on 8/6/21.
//

import Foundation
import AVKit

var videoPlayer : AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    print(Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil)
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: "mp4")!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
