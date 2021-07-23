//
//  State.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/23.
//

import Foundation

struct State: Decodable {
    let comments: Int?
    let chat: Int?
    let interest: Int?
}

extension State {

    func toContectState() -> [ContectState] {
        [.comments(comments),
         .chat(chat),
         .interest(interest)]
    }
    
}
