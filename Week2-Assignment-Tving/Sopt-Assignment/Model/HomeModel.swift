//
//  HomeModel.swift
//  Week3-Assignment-Tving-Home
//
//  Created by 김민성 on 4/30/24.
//

import UIKit

struct mainModel {
    var image: UIImage
    var title: String
    var info: String
    
    static func getData() -> [mainModel] {
        return [
            mainModel(
                image: UIImage(resource: .mainImage1),
                title: "지켜보고 있다",
                info: "곧 개무서운 영화가 온다"
            ),
            mainModel(
                image: UIImage(resource: .mainImage1),
                title: "마녀 사냥",
                info: "신동엽의 19금 토크쇼 이제 시작."
            ),
            mainModel(
                image: UIImage(resource: .mainImage1),
                title: "시그널",
                info: "조진웅 김혜수 이재훈 오지는 조합!"
            ),
            mainModel(
                image: UIImage(resource: .mainImage1),
                title: "시그널",
                info: "조진웅 김혜수 이재훈 지리는 조합!"
            ),
            mainModel(
                image: UIImage(resource: .mainImage1),
                title: "시그널",
                info: "조진웅 김혜수 이재훈 개쩌는 조합!"
            ),
            mainModel(
                image: UIImage(resource: .mainImage1),
                title: "마녀 사냥",
                info: "신동엽의 19금 토크쇼 이제 시작."
            ),
            mainModel(
                image: UIImage(resource: .mainImage1),
                title: "마녀 사냥",
                info: "신동엽의 19금 토크쇼 이제 시작."
            ),
            mainModel(
                image: UIImage(resource: .mainImage1),
                title: "마녀 사냥",
                info: "신동엽의 19금 토크쇼 이제 시작."
            )
        ]
    }
}
