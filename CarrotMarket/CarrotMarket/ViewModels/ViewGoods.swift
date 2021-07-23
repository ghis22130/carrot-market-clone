//
//  ViewGoods.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/17.
//

import UIKit

struct ViewGoods {
    let id: Int
    let imgURL: String
    let title: String
    let locationAndTime: String
    let price: String
    let contectState: [ContectState]
    
    init(goods: Goods) {
        self.id = goods.id
        self.imgURL = goods.imgUrl
        self.title = goods.title
        self.locationAndTime = [goods.location
                                , goods.time.intervalNow()].joined(separator: " · ")
        self.price = goods.price.currencyKR()
        self.contectState = goods.state.toContectState()
    }
}
