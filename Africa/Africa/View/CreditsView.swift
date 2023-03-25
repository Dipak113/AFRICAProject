//
//  CreditsView.swift
//  Africa
//
//  Created by Apple on 20/09/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("launch-screen-image")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
         Copyright @ Robert Petras
 All right reserved Better Apps ❤️
 """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//:VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
