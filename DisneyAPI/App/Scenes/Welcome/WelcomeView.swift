//
//  WelcomeView.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func didTapButton()
}

class WelcomeView: UIView {
    lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: WelcomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButton() {
        delegate?.didTapButton()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .white
        addSubview(enterButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            enterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            enterButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: 180),
            enterButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
