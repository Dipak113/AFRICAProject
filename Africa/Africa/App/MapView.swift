//
//  MapView.swift
//  Africa
//
//  Created by Apple on 01/09/22.
//

import SwiftUI
import MapKit
struct MapView: View {
    // MARK: - PROPERTIES
    //Closure
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations:[NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    
    var body: some View {
    // MARK: - NO1 BASIC MAP
    //Map(coordinateRegion: $region)
        
    //MARK: - No2 ADVANCED MAP
    Map(coordinateRegion: $region, annotationItems: locations,annotationContent:{ item in
            // (A) PIN: OLD STYLE (always Static)
        //MapPin(coordinate: item.location, tint: .orange)
        
        // (B) MARKER: NEW STYLE (always static)
        //MapMarker(coordinate: item.location, tint: .orange)
        
        // (C) CUSTOM BAISC ANNOTATION (it could be interactive)
//        MapAnnotation(coordinate: item.location) {
//            Image("logo")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 32, height: 32, alignment: .center)
//          } //: ANNOTATION
        
        // (D) CUSTOM ADVANCED ANNOTATION (it could be interactive)
        MapAnnotation(coordinate: item.location){
            MapAnnotationView(location: item)
        }
        }) //: MAP
            .overlay(
                HStack(alignment:.center,spacing: 12){
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 3){
                        HStack{
                            Text("Latitude")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        
                        Divider()
                        
                        HStack{
                            Text("Logitude")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                    
                }  //: HSTACK
                    .padding(.vertical)
                    .padding(.horizontal,14)
                    .background(
                        Color.black
                            .cornerRadius(8)
                            .opacity(0.6)
                    )
                    .padding()
                , alignment:.top
        )
    }
}

//MARK: - PRVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
