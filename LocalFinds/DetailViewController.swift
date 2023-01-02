//
//  DetailViewController.swift
//  LocalFinds
//
//  Created by Grant Watson on 12/31/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var poi: String?
    var detailView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = poi
        
        view.backgroundColor = .white
        
        configureTitleLabel()
    }
    
    func configureTitleLabel() {
        let titleLabel = UILabel()
        self.view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = poi ?? "Location"

        NSLayoutConstraint.activate( [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }

}
