//
//  CoverImageView.swift
//  Africa
//
//  Created by Apple on 02/09/22.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    
    //MARK: - BODY
    var body: some View {
        TabView{
            ForEach(coverImages){ item in
                Image(item.name)
                     .resizable()
                     .scaledToFill()
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())

    }
}

//MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
        //Smaller view to display images
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
