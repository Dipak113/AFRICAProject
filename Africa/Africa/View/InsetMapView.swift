//
//  InsetMapView.swift
//  Africa
//
//  Created by Apple on 05/09/22.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - PROPERTIES
    //:Wrapper to Region
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 6.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    // MARK: - BODY
    var body: some View {
       Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()){
                    HStack{
                        Image(systemName: "mappin.circle")
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.orange)
                            .font(.body)
                    }// : HSTACK
                    .padding(.vertical,10)
                    .padding(.horizontal,14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                   
            }//: Navigation
                    .padding(12)
                , alignment: .topTrailing
        )
            .frame(height:256)
            .cornerRadius(12)
    }
}

// MARK: - PREVIEW
struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
