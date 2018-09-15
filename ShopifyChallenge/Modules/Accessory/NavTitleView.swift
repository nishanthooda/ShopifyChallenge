//
//  NavTitleView.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-14.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

class NavTitleView: UIView
{
    private let shopifyImageWidth: CGFloat = 60

    init(title: String)
    {
        super.init(frame: CGRect.zero)
        
        self.setupView(title: title)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(title: String)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UITableViewCell.generateLabel(font: ShopifyTheme.font.l.bold(), color: ShopifyTheme.color.text, text: title)
        
        let shopifyImage = UIImageView()
        shopifyImage.translatesAutoresizingMaskIntoConstraints = false
        shopifyImage.image = UIImage(named: "shopifyLogo")
        
        self.addSubview(shopifyImage)

        shopifyImage.widthAnchor.constraint(equalToConstant: self.shopifyImageWidth).isActive = true
        shopifyImage.topAnchor.constraint(equalTo: self.topAnchor, constant: ShopifyTheme.Spacing.xxs).isActive = true
        shopifyImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -ShopifyTheme.Spacing.xxs).isActive = true
        shopifyImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        self.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: ShopifyTheme.Spacing.xs).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -ShopifyTheme.Spacing.xs).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: shopifyImage.rightAnchor, constant: -ShopifyTheme.Spacing.s).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
