//
//  FeedViewController.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Olá Mundo!"
        text.textColor = .systemPink
        
        view.addSubview(text)
        view.backgroundColor = .cyan
        
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
