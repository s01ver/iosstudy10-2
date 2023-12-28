//
//  RegisterViewController.swift
//  iosstudy10-2
//
//  
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    // MARK: - Properties
    
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidNickname = false {
        didSet {
            self.validateUserInfo()
        }
    }
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    // Textfields
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var nicknameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var signupButton: UIButton!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Actions
    
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text

        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text

        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
        
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        self.userInfo?(userInfo)
    }
    
    
    
    // MARK: - Helpers
    private func setupTextField()
    {
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            
        }
        
    }
    
    private func validateUserInfo() {
        
        if isValidEmail && isValidName  && isValidNickname && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .systemBlue
            }
            
        } else {
            
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .opaqueSeparator
            }
        }
    }
    
    private func setupAttribute() {
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.systemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.systemBlue
        
        let attributes = generateButtonAttribute(self.popToLoginButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
        
    }
    
}

extension String {
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+=-]).{8,50}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

