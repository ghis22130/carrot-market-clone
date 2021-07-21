//
//  HomeViewModel.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/16.
//

import Foundation

import RxSwift

class HomeViewModel {

    let disposeBag = DisposeBag()
    
    // INPUT
    let fetchGoods: AnyObserver<Void>
    
    
    //OUTPUT
    let allGoods: Observable<[ViewGoods]>
    
    init(goodsStore: GoodsStore = GoodsStore()) {
        let fetching = PublishSubject<Void>()
        let goods = BehaviorSubject<[ViewGoods]>(value: [])
        
        fetchGoods = fetching.asObserver()
        
        fetching
            .flatMap { goodsStore.fetchGoods() }
            .map { $0.map { ViewGoods(goods: $0) } }
            .subscribe(onNext: goods.onNext)
            .disposed(by: disposeBag)
        
        allGoods = goods
        
    }
        
}
