//
//  CenterModifier.swift
//  Africa
//
//  Created by Apple on 20/09/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content:Content) -> some View{
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
