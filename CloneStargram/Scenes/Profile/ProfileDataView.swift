//
//  ProfileDataView.swift
//  CloneStargram
//
//  Created by 최진안 on 2023/05/22.
//

import SnapKit
import UIKit

final class ProfileDataView: UIView {
    
    private let title: String
    private let count: Int
    
    // 제목 라벨
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = title
        
        return label
    }()
    
    // 숫자를 세는 라벨
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.text = "\(count)"
        
        return label
    }()
    
    // 생성자
    init(title: String, count:Int) {
        self.title = title
        self.count = count
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - layout을 생성하는 확장 선언
private extension ProfileDataView {
    
    // layout 세팅
    func setupLayout() {
        // 순서를 잘 정해서 넣어줘야함
        let stackView = UIStackView(arrangedSubviews: [countLabel, titlelabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
