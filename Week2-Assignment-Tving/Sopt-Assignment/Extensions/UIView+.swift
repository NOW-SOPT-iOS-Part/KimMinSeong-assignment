//
//  UIView+.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 6/7/24.
//

import UIKit

extension UIView {
    
    /// UIView 여러 개 인자로 받아서 한 번에 addSubview 합니다.
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    /// width와 color를 받아 UIView의 Border를 설정합니다.
    func makeBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
