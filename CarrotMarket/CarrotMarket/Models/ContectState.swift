//
//  ContectState.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/16.
//

import Foundation

enum ContectState {
    case comments(Int?)
    case chat(Int?)
    case interest(Int?)
    
    var value: Int? {
        switch  self {
        case .comments(let value): return value
        case .chat(let value): return value
        case .interest(let value): return value
        }
    }
    
    var imageSource: String {
        switch  self {
        case .comments(_): return "bubble.right"
        case .chat(_): return "bubble.left.and.bubble.right"
        case .interest(_): return "heart"
        }
    }
}
