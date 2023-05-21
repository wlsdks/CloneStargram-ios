//
//  FeedTableViewCell.swift
//  CloneStargram
//
//  Created by 최진안 on 2023/05/22.
//

import SnapKit
import UIKit

/**
 테이블뷰에 보여질 피드 내용 cell을 설정하는 코드
 */
final class FeedTableViewCell: UITableViewCell {
    
    // MARK: - 게시글 이미지
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        
        return imageView
    }()
    
    // MARK: - 좋아요 버튼
    private lazy var likeButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(systemName: "heart")
        
        return button
    }()
    
    // MARK: - 댓글달기 버튼
    private lazy var commentButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.setImage(systemName: "message")
        
        return button
    }()
    
    // MARK: - dm보내기 버튼
    private lazy var directMessageButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.setImage(systemName: "paperplane")
        
        return button
    }()
    
    // MARK: - 북마크(즐겨찾기) 버튼
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.setImage(systemName: "bookmark")
        
        return button
    }()
    
    // MARK: - 게시글 최상단 라벨
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "최진안님 외 50명이 좋아합니다."
        
        return label
    }()
    
    // MARK: - 게시글 내용 라벨
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.numberOfLines = 5 // 5줄이 넘어가면 ... 으로 표시되도록 한다.
        label.text = "얼른 사이드 프로젝트를 성공해서 더 좋은 곳으로 가도록 노력해야겠다. 모두가 성공할수 있을것이며 노력하는자는 결국 성공한다. 나는 머리가 좋지는 못하니 천천히 노력해서 잘해지도록 하자 화이팅! 할수있다. 나도 힘내고 이준주임님도 같이 힘내자!! 할수있다!"
        
        return label
    }()
    
    // MARK: - 몇일전에 썼는지 보이는 라벨
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1일 전"
        
        return label
    }()
    
    func setup() {
        // 올릴 컴포넌트가 많으니 배열을 잘 활용하자
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            bookmarkButton,
            currentLikedCountLabel,
            contentsLabel,
            dateLabel
        ].forEach { addSubview($0) }

        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }

        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0

        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        let buttonSpacing: CGFloat = 12.0

        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(buttonSpacing)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        directMessageButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(buttonSpacing)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        bookmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }

        currentLikedCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }

        let labelVerticalSpacing: CGFloat = 8.0

        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(labelVerticalSpacing)
        }

        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(labelVerticalSpacing)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
    
}
