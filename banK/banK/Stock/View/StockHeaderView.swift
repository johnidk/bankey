//
//  StockHeaderView.swift
//  banK
//
//  Created by João Gabriel Lavareda Ayres Barreto on 04/10/23.
//

import Foundation
import UIKit

class StockHeaderView: UITableViewHeaderFooterView {
  
    lazy var subtitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Stay up to date with the stock market"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = appColor
    }
    
    func setupConstraints() {
        self.contentView.addSubview(subtitleLabel)

        
        NSLayoutConstraint.activate([
            self.subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
