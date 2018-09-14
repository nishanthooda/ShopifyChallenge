//
//  ShopifyImageView.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-14.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class ShopifyImageView: UIImageView
{
    var imageURLString: String?
    
    public func loadImage(withURL url: String)
    {
        if let defaultImage = UIImage(named: "shopifyLogo")
        {
            DispatchQueue.main.async {
                self.image = defaultImage
            }
        }
        
        self.imageURLString = url
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage
        {
            DispatchQueue.main.async {
                self.image = imageFromCache
            }
            return
        }
        
        DispatchQueue.global().async {
            _ = ShopifyRequest.shared.getRequest(urlString: url, callback: { [weak self] (data, error) in
                guard error == nil else { return }
                
                guard let responseData = data else { return }
                
                guard let imageToCache = UIImage(data: responseData) else { return }
                
                if self?.imageURLString == url
                {
                    DispatchQueue.main.async {
                        self?.image = imageToCache
                    }
                }
                
                imageCache.setObject(imageToCache, forKey: url as AnyObject)
            })
        }
    }
}

