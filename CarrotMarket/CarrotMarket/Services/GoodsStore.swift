//
//  GoodsStore.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/20.
//

import Foundation
import RxSwift

class GoodsStore {
    let url = ""
    
    func fetchGoods() -> Single<[Goods]> {
        struct Response: Decodable {
            let goods: [Goods]
        }

        return NetworkService.shared.get(url: url)
            .map { data in
                guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                    throw NSError(domain: "Decoding error", code: -1, userInfo: nil)
                }
                return response.goods
            }
    }
    
}
