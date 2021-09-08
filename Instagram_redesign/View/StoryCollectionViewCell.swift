//
//  StoryCollectionViewCell.swift
//  Instagram_redesign
//
//  Created by praveen mack on 31/08/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - properties
    
    var data: Stories? {
        didSet {
            configureUI()
        }
    }
    
    let profileImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 35
        return img
    }()
    
    let username: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return l
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImage)
        addSubview(username)
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helper function
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            profileImage.heightAnchor.constraint(equalToConstant: 70),
            profileImage.widthAnchor.constraint(equalToConstant: 70),
            profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            username.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            username.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            username.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            username.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureUI() {
        guard let data = data else { return }
        
        profileImage.image = data.image
        username.text = data.username
    }
}
