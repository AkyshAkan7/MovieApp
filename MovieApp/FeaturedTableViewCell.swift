//
//  TopRatedTableViewCell.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/8/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import UIKit
import SnapKit

class TopRatedTableViewCell: UITableViewCell {
    
    var movie: Movie? {
        didSet {
            guard let movieItem = movie else { return }
            movieTitleLabel.text = movieItem.title
        }
    }
    
    private let movieImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        return img
    }()
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
}

extension TopRatedTableViewCell {
    func makeUI() {
        [movieImageView, movieTitleLabel].forEach {
            contentView.addSubview($0)
        }
        
        movieImageView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(20)
            $0.height.equalTo(300)
            $0.width.equalTo(150)
        }
        
        movieTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalTo(movieImageView.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
