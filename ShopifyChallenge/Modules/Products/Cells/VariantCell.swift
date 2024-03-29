//
//  VariantCell.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import UIKit

class VariantCell: UITableViewCell
{
    static let identifer = "VariantCell"
    private let productImageHeight: CGFloat = 30
    
    let productImage = ShopifyImageView()
    lazy var titleLabel = UITableViewCell.generateLabel(font: ShopifyTheme.font.m.bold(), color: ShopifyTheme.color.text, text: "")
    lazy var priceLabel = UITableViewCell.generateLabel(font: ShopifyTheme.font.m, color: ShopifyTheme.color.text, text: "")
    lazy var inventoryLabel = UITableViewCell.generateLabel(font: ShopifyTheme.font.s, color: ShopifyTheme.color.text, text: "")
    lazy var weightLabel = UITableViewCell.generateLabel(font: ShopifyTheme.font.m, color: ShopifyTheme.color.text, text: "")
    
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
        self.selectionStyle = .none
        
        self.productImage.translatesAutoresizingMaskIntoConstraints = false
        self.productImage.clipsToBounds = true
        self.productImage.layer.cornerRadius = self.productImageHeight / 2
        
        self.contentView.addSubview(self.productImage)
        self.productImage.heightAnchor.constraint(equalToConstant: self.productImageHeight).isActive = true
        self.productImage.widthAnchor.constraint(equalToConstant: self.productImageHeight).isActive = true
        self.productImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: ShopifyTheme.Spacing.s).isActive = true
        
        self.contentView.addSubview(self.priceLabel)
        self.priceLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.priceLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -ShopifyTheme.Spacing.l).isActive = true
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: ShopifyTheme.Spacing.s).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.productImage.rightAnchor, constant: ShopifyTheme.Spacing.m).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.priceLabel.rightAnchor, constant: -ShopifyTheme.Spacing.m).isActive = true
        
        self.contentView.addSubview(self.inventoryLabel)
        self.inventoryLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: ShopifyTheme.Spacing.xxxs).isActive = true
        self.inventoryLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -ShopifyTheme.Spacing.s).isActive = true
        self.inventoryLabel.leftAnchor.constraint(equalTo: self.productImage.rightAnchor, constant: ShopifyTheme.Spacing.m).isActive = true
        self.inventoryLabel.rightAnchor.constraint(equalTo: self.priceLabel.rightAnchor, constant: -ShopifyTheme.Spacing.m).isActive = true
    }
}
