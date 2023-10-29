//
//  TableViewController.swift
//  sopt33-third-seminar
//
//  Created by 최서연 on 10/28/23.
//

import UIKit
import SnapKit
import Then

class TableViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .init(red: 33.0 / 255.0,
                                   green: 33.0 / 255.0,
                                   blue: 33.0 / 255.0,
                                   alpha: 1.0)
        $0.separatorColor = .lightGray
        $0.separatorStyle = .singleLine
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTableViewConfig()
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            // 화면에 꽉차게 테이블뷰의 constraints를 잡아줌
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.register(ItemListTableViewCell.self, forCellReuseIdentifier: ItemListTableViewCell.identifier)
        self.tableView.delegate = self  // self: 현재 뷰컨에서 델리게이트를 하겠다는 의미
        self.tableView.dataSource = self
    }
}

extension TableViewController: UITableViewDelegate {
    
}

extension TableViewController: UITableViewDataSource {
    //섹션(section)별로 해당 섹션의 행(row) 수를 반환하는 메소드입니다. 필수 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemListData.count
    }
    
    //각 행의 셀(cell) 객체를 반환하는 메소드입니다. 필수 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.identifier, for: indexPath) as? ItemListTableViewCell else {return UITableViewCell()}
        
        cell.likeTapCompletion = { [weak self] state in
                    guard let self else {return}
                    itemListData[indexPath.row].isLike = state
                }
        
        cell.bindData(data: itemListData[indexPath.row])
        return cell
    }
}
