//
//  UploadViewController.swift
//  CloneStargram
//
//  Created by 최진안 on 2023/05/22.
//

import SnapKit
import UIKit

/**
 이미지를 선택하면 업로드를 위해 내용을 적는 뷰를 보여주는 컨트롤러
 */
final class UploadViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationItem()
    }
    
    
}

private extension UploadViewController {
    func setupNavigationItem() {
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "취소",
            style: .plain,
            target: self,
            action: #selector(didTapLeftButton)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "공유",
            style: .plain,
            target: self,
            action: #selector(didTapRightButton)
        )
    }
    
    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapRightButton() {
        // TODO: 저장하기 코드 추가
        dismiss(animated: true)
    }
    
}
