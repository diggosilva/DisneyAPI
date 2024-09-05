//
//  FeedCell.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import UIKit

class FeedCell: UITableViewCell {
    static let identifier = "FeedCell"
    
    lazy var movieImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "person")
        iv.backgroundColor = .green
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    lazy var nameMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Filme"
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        return label
    }()
    
    lazy var nameActorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Personagem"
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameMovieLabel, nameActorLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubviews([movieImage, stackView])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieImage.widthAnchor.constraint(equalToConstant: 60),
            movieImage.heightAnchor.constraint(equalToConstant: 80),
            movieImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 80),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
        ])
    }
}
