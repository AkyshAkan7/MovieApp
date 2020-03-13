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

// MARK: - make UI
extension SectionTableViewCell {
    func makeUI() {
        contentView.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(15)
            $0.right.bottom.equalToSuperview().offset(-15)
        }
    }
}
