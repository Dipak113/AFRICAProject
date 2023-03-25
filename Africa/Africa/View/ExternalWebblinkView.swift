//
//  ExternalWebblinkView.swift
//  Africa
//
//  Created by Apple on 05/09/22.
//

import SwiftUI

struct ExternalWebblinkView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                Image(systemName: "arrow.up.right.square")
                    Link(animal.link,destination: (URL(string:animal.link) ?? URL(string: "https://wikipedia.org"))!)
              
                }
                .foregroundColor(.orange)
            }//: HSTACK
        }//: GroupBox
      
    }
}

// MARK: - PREVIEW
struct ExternalWebblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
