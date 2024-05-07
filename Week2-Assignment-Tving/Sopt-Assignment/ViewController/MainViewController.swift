//
//  MainViewController.swift
//  Week3-Assignment-Tving-Home
//
//  Created by 김민성 on 4/30/24.
//

import UIKit

enum HomeSection: Int, CaseIterable {
    case main = 0
    case recommand // 1
    case live // 2
    
    var identifier: String {
        switch self {
        case .main:
            return MainCollectionViewCell.className
        case .recommand:
            return RecommandCollectionViewCell.className
        case .live:
            return PopularLiveChannelCollectionViewCell.className
            
        }
    }
}


final class MainViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: property
    private let titleLists: [String] = [
        "티빙에서 꼭 봐야하는 콘텐츠",
        "인기 LIVE 채널",
    ]
    
    private let imagesBySection: [Int: [UIImage]] = [
        0: [UIImage(resource: .mainImage1), UIImage(resource: .mainImage1), UIImage(resource: .mainImage1), UIImage(resource: .mainImage1), UIImage(resource: .mainImage1)],
        1: [UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1), UIImage(resource: .image1)],
        2: [UIImage(resource: .image2), UIImage(resource: .image2), UIImage(resource: .image2), UIImage(resource: .image2)],
    ]
    
    private var mainModelItems: [mainModel] = mainModel.getData()
    
    // MARK: UIComponents
    let homeView = HomeView()
    
    // MARK: Life Cycles
    override func loadView() {
        self.view = homeView
        if let navigationController = self.navigationController {
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
    }
    
    func setDelegate() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
    
    func setRegister() {
        // header cell 등록
        homeView.collectionView.register(HomeViewHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeViewHeaderCell")
        homeView.collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: HomeSection.main.identifier)
        homeView.collectionView.register(RecommandCollectionViewCell.self, forCellWithReuseIdentifier: HomeSection.recommand.identifier)
        homeView.collectionView.register(PopularLiveChannelCollectionViewCell.self, forCellWithReuseIdentifier: HomeSection.live.identifier)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection.main.identifier, for: indexPath) as! MainCollectionViewCell
            let model = mainModelItems[indexPath.row]
            cell.bindData(image: model.image, title: model.title, info: model.info)
            return cell
            
        // recommand cell에서 이미지가 제대로 뜨지 않음.
        case .recommand:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection.recommand.identifier, for: indexPath) as! RecommandCollectionViewCell
            
            if let item = imagesBySection[1] {
                cell.bindData(image: item[indexPath.row])
            }
            return cell
            
        case .live:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection.live.identifier, for: indexPath) as! PopularLiveChannelCollectionViewCell
            
            if let item = imagesBySection[2] {
                cell.bindData(image: item[indexPath.row])
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeViewHeaderCell.className, for: indexPath) as? HomeViewHeaderCell else {
            return UICollectionReusableView()
        }
        
        let section = HomeSection(rawValue: indexPath.section)!
        switch section {
        case .main: break
            
        case .recommand:
            headerView.bindTitle(title: titleLists[0])
        case .live:
            headerView.bindTitle(title: titleLists[1])
        }
        return headerView
    
    }
}
