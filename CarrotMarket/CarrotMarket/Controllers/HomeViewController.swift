//
//  HomeViewController.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/16.
//

import Foundation
import AsyncDisplayKit
import RxSwift
import RxCocoa

class HomeViewController: ASDKViewController<ASTableNode> {

    let goods: [Goods] = []
    
    override init() {
        super.init(node: ASTableNode())
        self.node.insetsLayoutMarginsFromSafeArea = true
        self.node.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension HomeViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        goods.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let item = goods[indexPath.row]
        return {
            return GoodsListCellNode(with: item)
        }
    }
}

