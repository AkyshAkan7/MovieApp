//
//  SectionTableViewCell.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/9/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show all", for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(item: SectionItem) {
        categoryLabel.text = item.label
    }

}

// MARK: - UI
extension SectionTableViewCell {
    func makeUI() {
        contentView.addSubview(categoryLabel)
        contentView.addSubview(nextButton)
        
        categoryLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-15)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.left.equalTo(categoryLabel.snp.right)
            $0.right.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-15)
        }
        
    }
}
