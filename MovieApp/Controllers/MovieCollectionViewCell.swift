
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/9/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        img.backgroundColor = .black
        return img
    }()
    
    private let titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    private let yearLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    private let starImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = #colorLiteral(red: 0.002061008476, green: 0.8217948079, blue: 0.465944171, alpha: 1)
        return image
    }()
    
    private let averageVoteLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.releaseDate
        averageVoteLabel.text = String(movie.averageVote!)
        guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w780/\(movie.posterPath ?? "")") else { return }
        imageView.af_setImage(withURL: imageURL)
    }
    
    func makeUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(averageVoteLabel)
        contentView.addSubview(starImageView)
        
        imageView.snp.makeConstraints {
            $0.height.equalTo(180)
            $0.width.equalTo(100)
            $0.top.left.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(5)
            $0.right.equalToSuperview()
        }
        
        yearLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(5)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
        starImageView.snp.makeConstraints {
            $0.left.equalTo(yearLabel.snp.right).offset(12)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.height.width.equalTo(13)
        }
        
        averageVoteLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.equalTo(starImageView.snp.right).offset(3)
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-5)
        }
        
    }
}

