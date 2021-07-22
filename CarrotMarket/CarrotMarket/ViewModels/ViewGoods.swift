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
    let contectState: [State]
    
    init(goods: Goods) {
        self.id = goods.id
        self.imgURL = goods.imgUrl
        self.title = goods.title
        self.locationAndTime = [goods.location, goods.time].joined(separator: " · ")
        self.price = "\(goods.price)"
        self.contectState = [.comments(goods.contectState.comments),
                              .chat(goods.contectState.chat),
                              .interest(goods.contectState.interest)]
    }
}

enum State {
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
    
    var text: NSMutableAttributedString? {
        guard let value = self.value else { return nil }
        let attachment = NSTextAttachment()
        DispatchQueue.main.async {
            attachment.image = UIImage(systemName: self.imageSource)
        }
        let attachmentString = NSAttributedString(attachment: attachment)
        let contentString = NSMutableAttributedString(string: "\(value)")
        contentString.append(attachmentString)
        return contentString
    }
}
