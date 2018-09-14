//
//  ProductsViewModel.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

class ProductsViewModel
{
    var products: [Product]
    
    init(products: [Product])
    {
        self.products = products
    }
}
