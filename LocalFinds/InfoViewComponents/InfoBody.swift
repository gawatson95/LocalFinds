//
//  BodyTextView.swift
//  LocalFinds
//
//  Created by Grant Watson on 1/7/23.
//

import UIKit

class InfoBody: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .label
        translatesAutoresizingMaskIntoConstraints = false
    }
}
