//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by João Gabriel Ramos on 05/05/26.
//

import Foundation
import UIKit

class LoginBottomSheetView:UIView {
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let handleArea:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let emailTextFieldLabel : UILabel = {
        let label = UILabel()
        label.text = "login.emailText.label.title".localized
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let emailTextField :UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.email.placeholder".localized
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordTextFieldLabel : UILabel = {
        let label = UILabel()
        label.text = "login.passwordText.label.title".localized
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField :UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.password.placeholder".localized
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.tintColor = .white
        button.titleLabel?.font = Typography.subHeading
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI (){
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(emailTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextFieldLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: Metrics.medium),
            
            emailTextFieldLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: Metrics.medium),
            
            
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            
            
            
        ])
    }
    @objc
    private func loginButtonDidTapped(){
        let password = passwordTextField.text ?? ""
        let user = emailTextField.text ?? ""
        
        delegate?.sendLoginData(user: user, password: password)
    }
}
