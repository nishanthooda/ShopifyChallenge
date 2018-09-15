//
//  TagsCell.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

class TagsCell: UITableViewCell
{
    static let identifer = "tagsCell"
    private let arrowImageHeight: CGFloat = 25
    
    lazy var titleLabel = UITableViewCell.generateLabel(font: ShopifyTheme.font.m, color: ShopifyTheme.color.text, text: "")
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI()
    {
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: ShopifyTheme.Spacing.m).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -ShopifyTheme.Spacing.m).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: ShopifyTheme.Spacing.m).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -ShopifyTheme.Spacing.m).isActive = true
        
        let arrowImageView = UIImageView()
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.image = UIImage(named: "arrowImage")!.withRenderingMode(.alwaysTemplate)
        arrowImageView.tintColor = UIColor.lightGray
        
        self.contentView.addSubview(arrowImageView)
        arrowImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -ShopifyTheme.Spacing.s).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: self.arrowImageHeight).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: self.arrowImageHeight).isActive = true
    }
}

extension UITableViewCell
{
    static func generateLabel(font: UIFont, color: UIColor, text: String) -> UILabel
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.text = text
        label.textColor = color
        
        return label
    }
}
