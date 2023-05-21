//
//  SceneDelegate.swift
//  CloneStargram
//
//  Created by 최진안 on 2023/05/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground // 백그라운드 설정
        window?.rootViewController = TabBarController() // 메인 컨트롤러 지정
        window?.tintColor = .label // 틴트컬러 설정
        window?.makeKeyAndVisible()
    }


}

