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
    let time: String
    let price: Int
    let contectState: ContectState
}

