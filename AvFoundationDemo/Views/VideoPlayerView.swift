//
//  VideoPlayerView.swift
//  AvFoundationDemo
//
//  Created by test on 11/20/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State var avPlayer : AVPlayer? = {
        if let videoURL = Bundle.main.url(forResource: "sample", withExtension: "mp4") {
            return AVPlayer(url: videoURL)
        }
        return nil
    }()
    
    var body: some View {
        VStack{
            if let avPlayer = avPlayer{
                VideoPlayer(player: avPlayer)
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .onAppear {
                        avPlayer.play()
                    }
                    .onDisappear {
                        avPlayer.pause()
                    }
            }else{
                Text("Video not found")
                    .foregroundStyle(.red)
                    .font(.title)
            }
        }
    }
}

#Preview {
    VideoPlayerView()
}
