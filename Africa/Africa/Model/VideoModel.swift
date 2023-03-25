//
//  VideoModel.swift
//  Africa
//
//  Created by Apple on 06/09/22.
//

import Foundation

struct Video:Codable,Identifiable{
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumnail: String {
        "video-\(id)"
    }
}
