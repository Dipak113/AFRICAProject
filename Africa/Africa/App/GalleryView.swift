//
//  GalleryView.swift
//  Africa
//
//  Created by Apple on 01/09/22.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    //SIMPLE GRID DEFINATION
    //3 Column layout with flexible size
    //    let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    //EFFICIENT GRID DEFINATION
//    let gridLayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    
    
    func gridSwitch(){
        gridLayout = Array(repeating:.init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 30) {
                //MARK: - IMAGE
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth:8))
                
                Slider(value: $gridColumn,in:2...4,step:1)
                    .padding(.horizontal)
                    .foregroundColor(.orange)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                // MARK: - GRID
                LazyVGrid(columns:gridLayout,alignment: .center,spacing: 10){
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth:1))
                            .onTapGesture(){
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//: LOOP
                }//: GRID
                .animation(.easeIn)
                .onAppear(perform:{
                    gridSwitch()
                })
            }//: VSTACK
            .padding(.horizontal,10)
            .padding(.vertical,50)
        }//: SCROLL
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
