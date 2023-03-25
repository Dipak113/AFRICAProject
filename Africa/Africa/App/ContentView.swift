//
//  ContentView.swift
//  Africa
//
//  Created by Apple on 01/09/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let hptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var  gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number \(gridColumn)")
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
   
        // MARK: - BODY
        NavigationView{
            Group{
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) {animal in
                            NavigationLink(destination:AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            } //:LINK
                        }//:LOOP
                    CreditsView()
                            .modifier(CenterModifier())
                    }//:LIST
                } else {
                    ScrollView(.vertical,showsIndicators: false){
                        LazyVGrid(columns:gridLayout,alignment: .center,spacing: 10){
                            ForEach(animals){ animal in
                                NavigationLink(destination:AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }//:LINK
                            }//:LOOP
                      }//:GRID
                        .padding()
                        .animation(.easeIn)
                    }//:SCROLL
                }//: LIST
            }//:GROUP
            .navigationBarTitle("Africa",displayMode:.large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing:16){
                        // LIST
                        Button(action:{
                            print("List View is activated")
                            isGridViewActive = false
                            hptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary: .orange)
                            
                        }
                        
                        //GRID
                        Button(action:{
                            print("Grid View is activated")
                            isGridViewActive = true
                            hptics.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName:toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary: .blue)
                        }
                    }//:HSTACK
                }//:BUTTONS
            }//: TOOLBAR
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
