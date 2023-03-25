//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Apple on 10/09/22.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK: - PROPERTIES
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    
    var body: some View {
        ZStack{
            Circle()
                .fill()
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.orange,lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }//: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
    static var location: [NationalParkLocation] = Bundle.main
        .decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: location[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
