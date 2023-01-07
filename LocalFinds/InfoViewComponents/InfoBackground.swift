//
//  SectionBackground.swift
//  LocalFinds
//
//  Created by Grant Watson on 1/7/23.
//

import UIKit

class InfoBackground: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .init(white: 0, alpha: 0.10)
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.lightGray.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
