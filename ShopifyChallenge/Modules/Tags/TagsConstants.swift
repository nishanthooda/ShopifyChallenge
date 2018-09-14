//
//  ShopifyConstants.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation

struct ShopifyConstants
{
    static let estimatedRowHeight = 50
    static let dataURL = "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    static let tagSplitter = ", "
    
    struct JSONKeys
    {
        static let image = "image"
        static let inventory = "inventory_quantity"
        static let price = "price"
        static let products = "products"
        static let source = "src"
        static let tags = "tags"
        static let title = "title"
        static let variants = "variants"
        static let weight = "weight"
        static let weightUnit = "weight_unit"
    }
}
