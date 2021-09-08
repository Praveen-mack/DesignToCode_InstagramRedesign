//
//  PostCardCollectionViewCell.swift
//  Instagram_redesign
//
//  Created by praveen mack on 01/09/21.
//

import UIKit

struct Posts {
    let profileImage: UIImage
    let username: String
    let postImage: UIImage
}

class PostCardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var posts:[Posts] = [
        Posts(profileImage: #imageLiteral(resourceName: "img1"), username: "jack", postImage: #imageLiteral(resourceName: "post2")),
        Posts(profileImage: #imageLiteral(resourceName: "img4"), username: "samuel", postImage: #imageLiteral(resourceName: "post1")),
        Posts(profileImage: #imageLiteral(resourceName: "img2"), username: "carolina", postImage: #imageLiteral(resourceName: "post3")),
        Posts(profileImage: #imageLiteral(resourceName: "img5"), username: "puggy_101", postImage: #imageLiteral(resourceName: "post2")),
    ]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCollectionViewCell")
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.pin(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
        cell.data = posts[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
