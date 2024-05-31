//
//  PopularLiveChannelCollectionViewCell.swift
//  Week3-Assignment-Tving-Home
//
//  Created by 김민성 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class PopularLiveChannelCollectionViewCell: UICollectionViewCell {
    
    // MARK: Property
    
    // MARK: UI Components
    private let liveChannelImage = UIImageView().then {
        $0.image = UIImage(resource: .image1)
    }
    
    private let rankingLabel = UILabel().then {
        let italicFont = UIFont.italicSystemFont(ofSize: 20)
        let attributedString = NSAttributedString(string: "1", attributes: [NSAttributedString.Key.font: italicFont])

        $0.attributedText = attributedString
        $0.textColor = .white
    }
    
    private let channelLabel = UILabel().then {
        $0.text = "Mnet"
        $0.textAlignment = .center
        $0.textColor = .white
        
    }
    
    private let episodeLabel = UILabel().then {
        $0.text = "보이즈 플래닛 12화"
        $0.textColor = UIColor(resource: .gray2)
        $0.textAlignment = .center
    }
    
    private let progressLabel = UILabel() .then {
        $0.text = "80.0%"
        $0.textColor = .white
    }
    
    // 각 라벨들이 나오기 전에 vstackView가 호울이 될 수 있으니 lazy로 처리
    private lazy var VStackView = UIStackView(arrangedSubviews: [channelLabel, episodeLabel, progressLabel]).then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
    }
    
    // 생명 주기에서 생성자 호출 시 수행될 작업들
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }
    
    // 뷰 계층구조 확립
    private func setHierarchy() {
        addSubviews(
            liveChannelImage,
            rankingLabel,
            VStackView
        )
    }
    
    // 뷰 레이아웃 잡기
    private func setLayout() {
        liveChannelImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.top.equalTo(liveChannelImage.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(18)
        }
        
        VStackView.snp.makeConstraints {
            $0.top.equalTo(liveChannelImage.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(36)
        }
    }
    
}

// MARK: extensions
extension PopularLiveChannelCollectionViewCell {
    func bindData(image: UIImage) {
        self.liveChannelImage.image = image
    }
}
