//
//  FeedCell.swift
//  DisneyAPI
//
//  Created by Diggo Silva on 05/09/24.
//

import UIKit
import SDWebImage

class FeedCell: UITableViewCell {
    static let identifier = "FeedCell"
    
    lazy var movieImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "person")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    lazy var nameActorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Personagem"
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.numberOfLines = 2
        return label
    }()
    
    lazy var dateCreatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "01/01/0001"
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameActorLabel, dateCreatedLabel])
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
    
    func configure(movie: FeedModel) {
        guard let url = URL(string: movie.movieImage) else { return }
        
        movieImage.sd_setImage(with: url)
        nameActorLabel.text = "Ator: \(movie.nomeAtor)"
        dateCreatedLabel.text = "Lançado: \(formatDateToBrazilian(dateString: movie.dateCreated))"
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
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieImage.widthAnchor.constraint(equalToConstant: 60),
            movieImage.heightAnchor.constraint(equalToConstant: 80),
            movieImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 80),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
        ])
    }
}
