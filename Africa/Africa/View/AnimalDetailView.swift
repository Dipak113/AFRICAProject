//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Apple on 04/09/22.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - PROPERTIES

    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.orange
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.orange)
                    .padding(.horizontal)
                
                //GALLERY
                //Group is used to avoid limitation of views in SwiftUI file
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
                    InsertGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                Group{
                    HeadingView(headingImage: "Questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                // DESCRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headingText:"All about \(animal.name)")
                    //TextView
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //MAP
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                //LINK
                Group{
                    HeadingView(headingImage: "books.verified", headingText: "Learn More")
                    ExternalWebblinkView(animal: animal)
                }//:Link
                
            } //: VSTACK
      
            .navigationBarTitle(Text("Learn about \(animal.name)"), displayMode: .inline)
        } //: SCROLL
    }
}

// MARK: - PREVIEW

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[1])
        }
        .previewDevice("iPhone 11 Pro")
    }
}
