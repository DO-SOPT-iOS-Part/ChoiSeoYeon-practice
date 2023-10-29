//
//  CollectionViewController.swift
//  sopt33-third-seminar
//
//  Created by 최서연 on 10/29/23.
//

import UIKit

class CollectionViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setCollectionViewConfig()
        self.setCollectionViewLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(ImageCollectionViewCell.self,
                                     forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
}

extension CollectionViewController: UICollectionViewDelegate {}
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                            for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        
        // ViewController에서 해당 셀의 delegate를 내가 하겠다!! 라고 선언
        item.delegate = self
        item.bindData(data: imageCollectionList[indexPath.row], row: indexPath.row)
        return item
    }
}

protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}

extension CollectionViewController: ItemSelectedProtocol {
    func getButtonState(state: Bool, row: Int) {
        imageCollectionList[row].isLiked = state
    }
}
