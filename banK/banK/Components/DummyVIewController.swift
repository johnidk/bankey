//
//  DummyVIewController.swift
//  banK
//
//  Created by João Gabriel Lavareda Ayres Barreto on 12/01/23.
//

import Foundation
import UIKit

class DummyViewController: UIViewController {
    let stackView = UIStackView()
    let label = UILabel()
    let logoutBtn = UIButton(type: .system)
    
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logoutBtn.translatesAutoresizingMaskIntoConstraints = false
        logoutBtn.configuration = .filled()
        logoutBtn.setTitle("Logout", for: [])
        logoutBtn.addTarget(self, action: #selector(logoutBtnTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutBtn)
        view?.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func logoutBtnTapped(sender: UIButton) {
        logoutDelegate?.didLogout()
    }
}



