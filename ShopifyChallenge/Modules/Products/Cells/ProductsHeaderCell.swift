//
//  ProductsHeaderCell.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-14.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import UIKit

class ProductHeaderCell: UITableViewHeaderFooterView
{
    static let identifer = "ProductHeaderCell"
    private let productImageHeight: CGFloat = 30
    
    let productImage = ShopifyImageView()
    lazy var titleLabel = UITableViewCell.generateLabel(font: ShopifyTheme.font.m, color: ShopifyTheme.color.text, text: "")
    
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI()
    {        
        self.productImage.translatesAutoresizingMaskIntoConstraints = false
        self.productImage.clipsToBounds = true
        self.productImage.layer.cornerRadius = self.productImageHeight / 2
        
        self.contentView.addSubview(self.productImage)
        self.productImage.heightAnchor.constraint(equalToConstant: self.productImageHeight).isActive = true
        self.productImage.widthAnchor.constraint(equalToConstant: self.productImageHeight).isActive = true
        self.productImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: ShopifyTheme.Spacing.s).isActive = true
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: ShopifyTheme.Spacing.m).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -ShopifyTheme.Spacing.m).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.productImage.rightAnchor, constant: ShopifyTheme.Spacing.m).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -ShopifyTheme.Spacing.m).isActive = true
    }
}
