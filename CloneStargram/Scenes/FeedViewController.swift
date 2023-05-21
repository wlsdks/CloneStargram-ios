//
//  FeedViewController.swift
//  CloneStargram
//
//  Created by 최진안 on 2023/05/22.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    


}

// MARK: - 메소드만 모을 확장 선언
private extension FeedViewController {
    
    // 네비게이션 바 설정 메소드
    func setupNavigationBar() {
        navigationItem.title = "CloneStargram"
        
        // 업로드 버튼 설정
        let uploadButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.rightBarButtonItem = uploadButton
    }
    
}
