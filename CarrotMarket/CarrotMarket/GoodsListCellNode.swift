//
//  GoodsListCellNode.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/16.
//

import Foundation
import AsyncDisplayKit
import RxSwift
import RxCocoa
import Then

class GoodsListCellNode: ASCellNode {
    typealias Node = GoodsListCellNode
    
    var goodsImageNode = ASNetworkImageNode().then {
        $0.style.preferredSize = CGSize(width: 100, height: 100)
        $0.backgroundColor = .red
        $0.cornerRadius = 10
    }
    
    var titleNode = ASTextNode().then {
        $0.maximumNumberOfLines = 2
    }
    
    var locationAndTimeNode = ASTextNode().then {
        $0.maximumNumberOfLines = 1
    }
    
    
    var priceNode = ASTextNode().then {
        $0.maximumNumberOfLines = 1
    }
    
    init(with item: Goods) {
        super.init()
        self.automaticallyManagesSubnodes = true
        
        self.titleNode.attributedText = NSAttributedString(string: item.title,
                                                           attributes: Node.titleAttributes)
        
        self.locationAndTimeNode.attributedText = NSAttributedString(string: item.location,
                                                                     attributes: Node.locationAndTimeAttributes)
        
        self.priceNode.attributedText = NSAttributedString(string: "\(item.price)",
                                                           attributes: Node.priceAttributes)
    }
    
}

extension GoodsListCellNode {
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let contentLayout = contentStackLayoutSpec()
        
        let goodsSpecLayout = ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 10,
                                                justifyContent: .start,
                                                alignItems: .stretch,
                                                children: [goodsImageNode,contentLayout])
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 15.0, left: 10.0, bottom: 15.0, right: 10.0),
                                 child: goodsSpecLayout)
        
    }
    
    private func contentStackLayoutSpec() -> ASStackLayoutSpec {
        
        let elements = [titleNode, locationAndTimeNode, priceNode].filter { $0.attributedText?.length ?? 0  > 0 }
        
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 5,
                                 justifyContent: .start,
                                 alignItems: .stretch,
                                 children: elements)
    }
    
}

extension GoodsListCellNode {
    static var titleAttributes: [NSAttributedString.Key: Any] {
        return [.font : UIFont.systemFont(ofSize: 17),
                .foregroundColor: UIColor.black]
    }
    
    static var locationAndTimeAttributes: [NSAttributedString.Key: Any] {
        return [.font : UIFont.systemFont(ofSize: 15),
                .foregroundColor: UIColor.gray]
    }
    
    static var priceAttributes: [NSAttributedString.Key: Any] {
        return [.font : UIFont.boldSystemFont(ofSize: 17),
                .foregroundColor: UIColor.black]
    }
}
