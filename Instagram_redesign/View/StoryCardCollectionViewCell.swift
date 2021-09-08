//
//  StoryCardCollectionViewCell.swift
//  Instagram_redesign
//
//  Created by praveen mack on 31/08/21.
//

import UIKit

private let reuseIdentifier = "StoryCardCollectionViewCell"

struct Stories {
    let image: UIImage
    let username: String
}

class StoryCardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var story = [Stories]()
    
    let cardView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.setCardShadow()
        v.layer.cornerRadius = 15
        return v
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCardCollectionViewCell")
        cv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cardView)
        cardView.addSubview(collectionView)
        collectionView.pin(to: cardView)
        setupConstraints()
        
        story = [
            Stories(image: #imageLiteral(resourceName: "img4"), username: "Add Story"),
            Stories(image: #imageLiteral(resourceName: "img2"), username: "jack"),
            Stories(image: #imageLiteral(resourceName: "img1"), username: "carolina"),
            Stories(image: #imageLiteral(resourceName: "img2"), username: "samuel"),
            Stories(image: #imageLiteral(resourceName: "img5"), username: "ariana josep"),
            Stories(image: #imageLiteral(resourceName: "img4"), username: "sam"),
            Stories(image: #imageLiteral(resourceName: "img3"), username: "dheep")
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
}

extension StoryCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return story.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCardCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        cell.data = story[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
