//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Apple on 07/09/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - PROPERTIES
    var videoSelected:String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(filename:videoSelected, fileFormat: "mp4")){
               // Text(videoTitle)
            }
           
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top,6)
                        .padding(.horizontal,8)
                    , alignment: .topLeading
                )
        }//: VSTACK
        .accentColor(.orange)
        .navigationBarTitle(videoTitle)
        
      
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
