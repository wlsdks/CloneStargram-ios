//
//  TabBarController.swift
//  CloneStargram
//
//  Created by 최진안 on 2023/05/22.
//

import UIKit

/**
 앱 하단의 탭bar를 설정하는 컨트롤러
 */
final class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationController에 embed하는게 필수다.
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        // navigationController에 embed하는게 필수다.
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        viewControllers = [feedViewController, profileViewController]
    }
}
