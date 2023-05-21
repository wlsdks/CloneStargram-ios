//
//  UIButton+.swift
//  CloneStargram
//
//  Created by 최진안 on 2023/05/22.
//

import UIKit

//helper메소드는 extension으로 주로 처리함
extension UIButton {
    // 커스텀 메서드
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}

