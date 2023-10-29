//
//  ItemListTableViewCell.swift
//  sopt33-third-seminar
//
//  Created by 최서연 on 10/28/23.
//

import UIKit
import SnapKit
import Then

class ItemListTableViewCell: UITableViewCell {
    
    static let identifier: String = "ItemListTableViewCell"
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 8
    }
    
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 2
        $0.textColor = .white
    }
    
    private let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .systemGray
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .black)
        $0.textColor = .white
    }
    
    // 클로져를 통한 list데이터의 값도 함께 변경
    var likeTapCompletion: ((Bool) -> Void)?
    
    @objc private func likeButtonTapped() {
        likeButton.isSelected.toggle()
        
        // 버튼이 눌렸을때, 해당 버튼의 isSelected상태를 전달해주기 위해서 사용해요!
        guard let likeTapCompletion else {return}
        likeTapCompletion(likeButton.isSelected)
    }
    
    //    private let likeButton = UIButton().then {
    //        $0.setImage(UIImage(systemName: "heart"), for: .normal)  // selected상태가아닐때
    //        $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)  // selected되었을때
    //    }
    //
    
    // 토글 버튼은 주로 lazy var로 선언해서 설정한다. -> addTarget 호출을 할때 사용되므로
    private lazy var likeButton = UIButton().then {
        $0.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 재사용 이슈를 막기 위한 코드
    override func prepareForReuse() {
        super.prepareForReuse()
        self.likeButton.isSelected = false
    }
    
    private func setLayout() {
        self.backgroundColor = .init(red: 33.0 / 255.0,
                                     green: 33.0 / 255.0,
                                     blue: 33.0 / 255.0,
                                     alpha: 1.0)
        
        [stackView, productImageView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        productImageView.snp.makeConstraints {make in
            make.top.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(128)
        }
        productImageView.layer.cornerRadius = 5
        productImageView.clipsToBounds = true
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(16)
            $0.top.trailing.equalToSuperview().inset(16)
        }
        likeButton.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom)
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
        [productNameLabel, locationLabel, priceLabel].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    func bindData(data: ItemListData) {
        self.productImageView.image = UIImage(named: data.image)
        self.productNameLabel.text = data.item
        self.priceLabel.text = data.price
        self.locationLabel.text = data.location
        self.likeButton.isSelected = data.isLike
    }
}

