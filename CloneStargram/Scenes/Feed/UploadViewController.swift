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
    // MARK: - 업로드 화면 이미지
    private let uploadImage: UIImage
    
    private let imageView = UIImageView()
    
    // MARK: - 업로드 화면: 텍스트를 작성하는 필드
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        textView.delegate = self
        
        return textView
    }()
    
    // MARK: - 업로드할 이미지를 외부에서 받아오도록 생성자를 만들어 준다.
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 앱 실행시 가장 먼저 이 메서드가 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationItem()
        setupLayout()
        
        imageView.image = uploadImage
    }
    
    
}

// MARK: - TextView의 델리게이트 확장 채택
extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}

// MARK: - 메서드 선언을 위해 확장선언
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

    // MARK: - 레이아웃 설정 메서드
    func setupLayout() {
        [imageView, textView].forEach {
            view.addSubview($0)
        }
        
        let imageViewInset: CGFloat = 16.0
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(imageViewInset)
            $0.leading.equalToSuperview().inset(imageViewInset)
            $0.width.equalTo(100.0)
            $0.height.equalTo(imageView.snp.width)
        }
        
        textView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(imageViewInset)
            $0.trailing.equalToSuperview().inset(imageViewInset)
            $0.top.equalTo(imageView.snp.top)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
}

