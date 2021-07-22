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
    	
    var disposeBag = DisposeBag()
    var viewModel = HomeViewModel()
    
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
        
        viewModel.allGoods
            .subscribe(onNext: { [weak self] _ in
                self?.node.reloadData()
            })
            .disposed(by: disposeBag)
    }


}

extension HomeViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        
        viewModel.allGoods
            .subscribe { goods in
                count = goods.element?.count ?? 0 }
            .disposed(by: disposeBag)
        
        return count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            var item: ViewGoods?
            
            self.viewModel.allGoods
                .subscribe { goods in
                    item = goods.element?.compactMap{ $0 }[indexPath.row]
                }.disposed(by: self.disposeBag)
            
            return GoodsListCellNode(with: item)
        }
    }
}

