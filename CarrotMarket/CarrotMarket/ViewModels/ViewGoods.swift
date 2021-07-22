//
//  ViewGoods.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/17.
//

import Foundation

struct ViewGoods {
    let id: Int
    let title: String
    let locationAndTime: String
    let price: String
    let contectState: [State: Int]
    
    init(goods: Goods) {
        self.id = goods.id
        self.title = goods.title
        self.locationAndTime = [goods.location, goods.time].joined(separator: " · ")
        self.price = "\(goods.price)"
        self.contectState = [.chat: goods.contectState?.chat ?? 0,
                                 .comments: goods.contectState?.comments ?? 0,
                                 .interest: goods.contectState?.interest ?? 0]
    }
}

enum State: Int, CaseIterable {
    case comments = 0
    case chat
    case interest
}
