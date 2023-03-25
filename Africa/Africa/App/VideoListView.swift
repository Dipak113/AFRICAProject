//
//  VideoListView.swift
//  Africa
//
//  Created by Apple on 01/09/22.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    //@State - make properties mutable
   @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style:.medium)
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List() {
                ForEach(videos) { item in
//Rename VideoListItem to VideoListItemView by refractor from left click on file name.It will change name all over project
                    NavigationLink(destination:VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical,8)
                    }
                }//:Repeat
            }//:LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle(Text("Videos"), displayMode: .inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                            .foregroundColor(.orange)
                    }
                }
            }
        }//: NAVIGATION
    }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
