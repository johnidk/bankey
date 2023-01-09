//
//  ViewController.swift
//  banker
//
//  Created by João Gabriel Lavareda Ayres Barreto on 02/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let bankeyName = UILabel()
    let introPhrase = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
    
    
}


extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        bankeyName.translatesAutoresizingMaskIntoConstraints = false
        bankeyName.isHidden = false
        bankeyName.text = "Bankey"
        bankeyName.textColor = .systemCyan
        
        introPhrase.translatesAutoresizingMaskIntoConstraints = false
        introPhrase.numberOfLines = 0
        introPhrase.text = "This text is like an iconic phrase for the app XD wassup wasup eoq dale daldea dsaoisdaosd aosid "
        introPhrase.sizeToFit()
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    
    private func layout() {
        view.addSubview(bankeyName)
        view.addSubview(introPhrase)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            
            bankeyName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bankeyName.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 20),
            
            introPhrase.topAnchor.constraint(equalToSystemSpacingBelow: bankeyName.bottomAnchor, multiplier: 2),
            introPhrase.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            introPhrase.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: introPhrase.trailingAnchor, multiplier: 2),
            
            
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
        
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("User or password is wrong")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username or psswd is blank")
            return
        }
        
        if username == "Kevin" && password == "1234" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
