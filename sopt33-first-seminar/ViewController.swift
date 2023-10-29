//
//  ViewController.swift
//  sopt33-first-seminar
//
//  Created by 최서연 on 2023/10/07.
//

import UIKit

final class ViewController: UIViewController {
    private var idText: String = ""
    private var passwordText: String = ""
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet weak var pushLoginButton: UIButton!
    @IBOutlet weak var presentLoginButton: UIButton!
    @IBOutlet weak var colorSwitch: UISwitch!
    @IBOutlet weak var colorModeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else { return }
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else { return }
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
    @IBAction func pushLoginButtonTap(_ sender: Any) {
        pushToResultVC()
    }
    
    @IBAction func presentLoginButtonTap(_ sender: Any) {
        presentToResultVC()
    }
    
    @IBAction func colorChangedSwitch(_ sender: UISwitch) {
        if sender.isOn {
            setYellowMode()
        }
        else {
            setPurpleMode()
        }
    }
    
    private func setYellowMode() {
        presentLoginButton.tintColor = .systemYellow
        pushLoginButton.tintColor = .systemYellow
        presentLoginButton.configuration?.baseForegroundColor = .black
        pushLoginButton.configuration?.baseForegroundColor = .black
        colorModeLabel.text = "Yellow Mode 🌙"
        descriptionLabel.textColor = .systemYellow
        colorSwitch.thumbTintColor = .systemYellow
        self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 235/255, alpha: 1.0)
    }
    
    private func setPurpleMode() {
        presentLoginButton.tintColor = .purple
        pushLoginButton.tintColor = .purple
        presentLoginButton.configuration?.baseForegroundColor = .white
        pushLoginButton.configuration?.baseForegroundColor = .white
        colorModeLabel.text = "Purple Mode 😈"
        descriptionLabel.textColor = .purple
        colorSwitch.thumbTintColor = .purple
        self.view.backgroundColor = UIColor(red: 199/255, green: 190/255, blue: 247/255, alpha: 1.0)
    }
    
    // 1. 푸시 팝 형식 전환
    private func pushToResultVC() {
        guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        resultVC.email = idText
        resultVC.password = passwordText
        resultVC.delegate = self
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    // 2. 모달 형식 전환
    private func presentToResultVC() {
        guard let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        resultVC.email = idText
        resultVC.password = passwordText
        resultVC.delegate = self
        present(resultVC, animated: true)
    }
}

// 코드 가독성을 위해 뷰컨에 직접 넣지 않고 extension을 사용하여 빼내서 작성한다
extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
