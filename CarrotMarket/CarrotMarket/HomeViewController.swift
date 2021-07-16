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

struct Goods {
    let id: Int
    let title: String
    let location: String
    let time: String
    let price: Int
    let contectState: String
}

class HomeViewController: ASDKViewController<ASTableNode> {

    let goods: [Goods] = [Goods(id: 0, title: "고사양 게임용 컴퓨터 팔아요 고사양 게임용 컴퓨터 팔아요 고사양 게임용 컴퓨터 팔아요 고사양 게임용 컴퓨터 팔아요", location: "화양동", time: "10초전", price: 790000, contectState: "(하트) 3"),
                          Goods(id: 1, title: "2", location: "32", time: "123", price: 123, contectState: "(하트) 3"),
                          Goods(id: 2, title: "아메리카노 2잔 판매합니다", location: "군자동", time: "20분 전", price: 19000, contectState: "(하트) 3")
    ]
    
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

