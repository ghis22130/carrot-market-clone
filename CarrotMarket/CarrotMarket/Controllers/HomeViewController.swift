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
        binding()
    }
    
    private func binding() {
    
        let load = Observable<Void>.just(())
        
        load
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: viewModel.fetchGoods)
            .disposed(by: disposeBag)
        
        viewModel.allGoods
            .subscribe(onNext: { [weak self] _ in
                DispatchQueue.main.async {
                    self?.node.reloadData()
                }
            })
            .disposed(by: disposeBag)
        
    }

}

extension HomeViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.items.count
        
        return count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let item: ViewGoods? = viewModel.items[indexPath.row]
        
        return {
            return GoodsListCellNode(with: item)
        }
    }
}

