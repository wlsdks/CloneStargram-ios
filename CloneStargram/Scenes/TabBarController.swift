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
        
        let feedViewController = UINavigationController(rootViewController: FeedViewController()) // 아직은 안만들어서 임의로 뷰컨트롤러를 설정해줌
        feedViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let profileViewController = UIViewController() // 아직은 안만들어서 임의로 뷰컨트롤러를 설정해줌
        profileViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        viewControllers = [feedViewController, profileViewController]
    }
}
