//
//  PostCollectionViewCell.swift
//  Instagram_redesign
//
//  Created by praveen mack on 01/09/21.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var data: Posts? {
        didSet{
            configureUI()
        }
    }
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setCardShadow()
        view.layer.cornerRadius = 15
        return view
    }()
    
    let profileImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        return img
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var likeImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "red-heart")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeImageTapped))
        tap.numberOfTapsRequired = 1
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    lazy var postImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    let gestureView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 15
        return v
    }()
    
    let heartImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "white-heart")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cardView)
        cardView.addSubview(profileImage)
        cardView.addSubview(likeImage)
        cardView.addSubview(username)
        cardView.addSubview(postImage)
        cardView.addSubview(gestureView)
        gestureView.addSubview(heartImage)
        gestureView.isHidden = true
        likeImage.alpha = 0
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Selectors
    
    @objc func likeImageTapped() {
        print("DEBUG: like tapped")
    }
    
    @objc func doubleTapped() {
        print("DEBUG: like tapped")
    }
    
    // MARK: - Helper function
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            cardView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            likeImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            likeImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            likeImage.heightAnchor.constraint(equalToConstant: 25),
            likeImage.widthAnchor.constraint(equalToConstant: 25),
            
            profileImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 17),
            profileImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            profileImage.heightAnchor.constraint(equalToConstant: 30),
            profileImage.widthAnchor.constraint(equalToConstant: 30),
            
            username.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            username.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            
            postImage.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 17),
            postImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 7),
            postImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -7),
            postImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -7),
            
            gestureView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 17),
            gestureView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 7),
            gestureView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -7),
            gestureView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -7),
            
            heartImage.centerYAnchor.constraint(equalTo: gestureView.centerYAnchor),
            heartImage.centerXAnchor.constraint(equalTo: gestureView.centerXAnchor),
            heartImage.widthAnchor.constraint(equalToConstant: 70),
            heartImage.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func configureUI() {
        guard let data = data else { return }
        profileImage.image = data.profileImage
        username.text = data.username
        postImage.image = data.postImage
    }
}
