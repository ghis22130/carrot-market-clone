//
//  File.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/16.
//

import Foundation

struct Goods: Decodable {
    let id: Int
    let imgUrl: String
    let title: String
    let location: String
    let time: Date
    let price: Int
    let state: State
    
    enum CodingKeys: String, CodingKey {
        case id
        case imgUrl = "image_url"
        case title
        case location
        case time
        case price
        case state = "contect_state"
    }
}

