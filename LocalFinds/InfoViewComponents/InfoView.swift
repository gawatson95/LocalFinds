//
//  RectangleView.swift
//  LocalFinds
//
//  Created by Grant Watson on 1/3/23.
//

import UIKit

class InfoView: UIView {
    let infoBackground = InfoBackground()
    var infoTitle = InfoTitle()
    var infoBody = InfoBody()
    
    var titleText: String!
    var bodyText: String!
    
    let padding: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleView()
        configureBackgroundView()
        configureBodyView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTitleView() {
        self.addSubview(infoTitle)
        infoTitle.text = titleText
        
        NSLayoutConstraint.activate([
            infoTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            infoTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            infoTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            infoTitle.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureBodyView() {
        self.addSubview(infoBody)
        infoBody.numberOfLines = 0
        infoBody.text = bodyText
        
        NSLayoutConstraint.activate([
            infoBody.topAnchor.constraint(equalTo: infoBackground.topAnchor),
            infoBody.leadingAnchor.constraint(equalTo: infoBackground.leadingAnchor, constant: padding),
            infoBody.trailingAnchor.constraint(equalTo: infoBackground.trailingAnchor, constant: -padding),
            infoBody.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        infoBody.backgroundColor = .red
    }
    
    private func configureBackgroundView() {
        self.addSubview(infoBackground)
        
        NSLayoutConstraint.activate([
            infoBackground.topAnchor.constraint(equalTo: infoTitle.bottomAnchor),
            infoBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            infoBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            infoBackground.heightAnchor.constraint(equalToConstant: 100),
            infoBackground.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40)
        ])
    }
}
