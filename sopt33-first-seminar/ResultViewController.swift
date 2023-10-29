//
//  ResultViewController.swift
//  sopt33-first-seminar
//
//  Created by 최서연 on 2023/10/07.
//

import UIKit

final class ResultViewController: UIViewController {
    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)?
    
    var email: String = ""
    var password: String = ""
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    
    private func bindText() {
        self.emailLabel.text = "email : \(self.email)"
        self.passwordLabel.text = "password : \(self.password)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindText()
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if self.navigationController != nil {
            // 네비게이션 스택안에 들어간 상태 -> push된 상태
            self.navigationController?.popViewController(animated: true)
        } else {
            // 네비게이션 스택 안에 안들어간 샅태 -> dismiss처리
            self.dismiss(animated: true)
        }
        
        delegate?.getLoginData(email: email, password: password)
        
        guard let loginDataCompletion else {return}
        loginDataCompletion([email, password])
    }
}
