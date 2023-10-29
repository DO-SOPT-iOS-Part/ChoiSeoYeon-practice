//
//  ViewController.swift
//  sopt33-third-seminar
//
//  Created by 최서연 on 10/28/23.
//

import UIKit
import SnapKit
import Then

// SnapKit, Then 실습
class ViewController: UIViewController {
    
    let boxView = UIView().then {
        $0.backgroundColor = .systemPink
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(boxView)
        
        boxView.snp.makeConstraints {make in
            //make.top.leading.trailing.bottom.equalToSuperview().inset(100)
            //make.edges.equalToSuperview().inset(100)  // 위 코드와 같은 표현 -> 모든 엣지에 다 inset 100만큼 부여
            //make.edges.equalToSuperview().offset(100)
            make.width.height.equalTo(100)
            //make.centerX.centerY.equalToSuperview()
            //make.center.equalToSuperview()  // 위 코드와 같은 표현 -> center X, Y 모두 적용
            
        }
    }
    
    
    
}

