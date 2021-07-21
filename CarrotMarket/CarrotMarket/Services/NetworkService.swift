//
//  NetworkService.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/20.
//

import Foundation
import RxSwift


class NetworkService {
    static let shared = NetworkService()
    
    private init() { }
    
    func get(url: String) -> Single<Data> {
        return Observable.create { emitter in
            do {
                guard let url = URL(string: url) else { throw NSError() }
    
                URLSession.shared.dataTask(with: url) { data, res, err in
                    if let err = err {
                        emitter.onError(err)
                    }
                    
                    guard let data = data else {
                        emitter.onError(NetworkError.dataFileReadFailed)
                        return
                    }
                    
                    emitter.onNext(data)
                    emitter.onCompleted()
                }.resume()
                
            } catch {
                emitter.onError(NetworkError.invalidURL)
            }
            
            return Disposables.create()
        }.asSingle()
    }
}

enum NetworkError: Error {
    case invalidURL
    case dataFileReadFailed
}
