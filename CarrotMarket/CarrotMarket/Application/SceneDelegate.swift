//
//  SceneDelegate.swift
//  CarrotMarket
//
//  Created by 지북 on 2021/07/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let homeViewController = HomeViewController()
        
        window?.rootViewController = homeViewController
        
        window?.makeKeyAndVisible()
    }

}

