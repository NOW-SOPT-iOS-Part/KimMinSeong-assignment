//
//  MainViewController.swift
//  Week3-Assignment-Tving-Home
//
//  Created by 김민성 on 4/30/24.
//

import UIKit
import Combine

enum HomeSection: Int, CaseIterable {
    case main = 0
    case recommand // 1
    case live // 2
    
    var identifier: String {
        switch self {
            case .main:
                return "MainCollectionViewCell"
            case .recommand:
                return "recommandCollectionViewCell"
            case .live:
                return "PopularLiveChannelCollectionViewCell"
                
        }
    }
}


final class MainViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: property
    private let titleLists: [String] = [
        "티빙에서 꼭 봐야하는 콘텐츠",
        "인기 LIVE 채널"
    ]
    
    private let imagesBySection: [Int: [UIImage]] = [
        0: [UIImage(resource: .mainImage1), UIImage(resource: .mainImage1), UIImage(resource: .mainImage1), UIImage(resource: .mainImage1), UIImage(resource: .mainImage1)],
        1: [UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1)],
        2: [UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1)],
    ]
    
    private var mainModelItems: [mainModel] = mainModel.getData()
    
    // MARK: UIComponents
    let homeView = HomeView()
    
    // MARK: Life Cycles
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setDelegate() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
    
    func setRegister() {
        homeView.collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        homeView.collectionView.register(recommandCollectionViewCell.self, forCellWithReuseIdentifier: "recommandCollectionViewCell")
        homeView.collectionView.register(PopularLiveChannelCollectionViewCell.self, forCellWithReuseIdentifier: "PopularLiveChannelCollectionViewCell")
    }
    
}
// MARK: UICollectionView dataSource
extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 8
        } else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = HomeSection(rawValue: indexPath.section)!
        
        switch section {
        case .main:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            let model = mainModelItems[indexPath.row]
            cell.bindData(image: model.image, title: model.title, info: model.info)
            return cell
            
        case .recommand:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommandCollectionViewCell", for: indexPath) as! recommandCollectionViewCell
            
            if let item = imagesBySection[1] {
                cell.bindData(image: item[indexPath.row])
            }
            return cell
            
        case .live:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularLiveChannelCollectionViewCell", for: indexPath) as! PopularLiveChannelCollectionViewCell
            
            if let item = imagesBySection[2] {
                cell.bindData(image: item[indexPath.row])
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeViewHeaderCell", for: indexPath) as? HomeViewHeaderCell else {
                    return UICollectionReusableView()
                }
                let section = HomeSection(rawValue: indexPath.section)!
                switch section {
                case .main:
                    headerView.bindTitle(title: titleLists[0])
                case .recommand:
                    headerView.bindTitle(title: titleLists[1])
                case .live:
                    headerView.bindTitle(title: titleLists[2])
                default:
                    headerView.bindTitle(title: "")
                }
                return headerView
                
            default:
                return UICollectionReusableView()
            }
            
            return UICollectionReusableView()
        }
    
    
}
