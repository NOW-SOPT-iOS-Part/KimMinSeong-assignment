//
//  className.swift
//  Week2-Assignment-Tving
//
//  Created by 김민성 on 5/1/24.
//

import UIKit

extension NSObject {
    public static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }

    public var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
