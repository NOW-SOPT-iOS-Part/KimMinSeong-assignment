//
//  WeeklyBoxOfficeView.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 5/10/24.
//

//import UIKit
//
//import SnapKit
//import Then
//
//final class WeeklyBoxOfficeView: UIView {
//    
//    // MARK: UIComponents
//    lazy var collectionView: UICollectionView = {
//        let layout = makeCollectionViewLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        collectionView.isScrollEnabled = true
//        collectionView.backgroundColor = .clear
//        collectionView.showsVerticalScrollIndicator = false
//        
//        return collectionView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setUI()
//        setHierarchy()
//        setLayout()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setUI() {
//        backgroundColor = .black
//    }
//    
//    func setHierarchy() {
//        addSubview(collectionView)
//        
//    }
//    
//    func setLayout() {
//        collectionView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//    }
//    
//    
//    
//    
//}
//
//// MARK: Extension
//
//extension WeeklyBoxOfficeView {
//    
//    func makeCollectionViewLayout() {
//        
//    }
//}
