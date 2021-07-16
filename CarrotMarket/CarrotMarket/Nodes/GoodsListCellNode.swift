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
        $0.clipsToBounds = true
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
    
    var contectStateNode = ASTextNode().then {
        $0.maximumNumberOfLines = 1
    }
    
    init(with item: Goods) {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
        self.titleNode.attributedText = NSAttributedString(string: item.title,
                                                           attributes: Node.titleAttributes)
        self.locationAndTimeNode.attributedText = NSAttributedString(string: item.location,
                                                                     attributes: Node.locationAndTimeAttributes)
        self.priceNode.attributedText = NSAttributedString(string: "\(item.price)",
                                                           attributes: Node.priceAttributes)
        self.contectStateNode.attributedText = NSAttributedString(string: "\(item.contectState)",
                                                                  attributes: Node.contectStateAttributes)
    }
    
}

extension GoodsListCellNode {
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let contentLayout = contentLayoutSpec()
        let connectStateLayout = connectStateLayoutSpec()
    
        return ASOverlayLayoutSpec(child: contentLayout, overlay: connectStateLayout)
    }
    
    private func contentLayoutSpec() -> ASInsetLayoutSpec {
        let goodsLayout = goodsStackLayoutSpec()
        goodsLayout.style.flexShrink = 1.0
        goodsLayout.style.flexGrow = 0.0
        
        goodsImageNode.style.flexShrink = 0.0
        goodsImageNode.style.flexGrow = 0.0
        
        let spec =  ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 10,
                                                justifyContent: .start,
                                                alignItems: .stretch,
                                                children: [goodsImageNode.styled {
                                                    $0.flexBasis = ASDimension(unit: .fraction, value: 0.3)
                                                },goodsLayout.styled {
                                                    $0.flexBasis = ASDimension(unit: .fraction, value: 0.7)
                                                }])
        
        let inset = UIEdgeInsets(top: 15.0, left: 10.0, bottom: 15.0, right: 10.0)
        
        return ASInsetLayoutSpec(insets: inset,
                                 child: spec)
    }
    
    private func goodsStackLayoutSpec() -> ASStackLayoutSpec {
        let elements = [titleNode, locationAndTimeNode, priceNode].filter { $0.attributedText?.length ?? 0  > 0 }
        
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 5,
                                 justifyContent: .start,
                                 alignItems: .stretch,
                                 children: elements)
    }
    
    private func connectStateLayoutSpec() -> ASRelativeLayoutSpec {
        let inset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 15.0, right: 20.0)
        let insetLayout = ASInsetLayoutSpec(insets: inset, child: self.contectStateNode)
        
        return ASRelativeLayoutSpec(horizontalPosition: .end,
                                    verticalPosition: .end,
                                    sizingOption: .minimumSize,
                                    child: insetLayout)
    }
    
}

extension GoodsListCellNode {
    static var titleAttributes: [NSAttributedString.Key: Any] {
        return [.font : UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black]
    }
    
    static var locationAndTimeAttributes: [NSAttributedString.Key: Any] {
        return [.font : UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.gray]
    }
    
    static var priceAttributes: [NSAttributedString.Key: Any] {
        return [.font : UIFont.boldSystemFont(ofSize: 16),
                .foregroundColor: UIColor.black]
    }
    
    static var contectStateAttributes: [NSAttributedString.Key: Any] {
        return [.font : UIFont.systemFont(ofSize: 13),
                .foregroundColor: UIColor.gray]
    }
}
