//
//  TagsViewModel.swift
//  TagsChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation

struct Product
{
    let imageURL: String
    let tags: [String]
    let title: String
    let variants: [Variant]
}

struct Variant
{
    let inventory: Int
    let price: String
    let title: String
    let weight: Double
    let weightUnit: String
}

class TagsViewModel
{
    var productsForTag: [String:[Product]] = [:]
    
    var tags: [String] = []
    
    func fetchData(completion: @escaping (Bool) -> Void)
    {
        _ = ShopifyRequest.shared.getRequest(urlString: TagsConstants.dataURL, callback: { (data, error) in
            
            guard error == nil else
            {
                completion(false)
                return
            }
            
            guard let responseData = data else
            {
                completion(false)
                return
            }
            
            do
            {
                guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String:AnyObject] else { return }
                
                self.parseData(from: json)
                completion(true)
            }
            catch
            {
                completion(false)
                print("ERROR: Unable convert to JSON")
            }
        })
    }
    
    func parseData(from json: [String:AnyObject])
    {
        guard let products = json[TagsConstants.JSONKeys.products] as? [AnyObject] else { return }
        
        //storing all the tags from different products, including duplicates
        var allTags: [String] = []
        
        for product in products
        {
            guard let tags = product[TagsConstants.JSONKeys.tags] as? String else { continue }
            
            let tagsArray = tags.components(separatedBy: TagsConstants.tagSplitter)
            allTags += tagsArray
            
            guard let title = product[TagsConstants.JSONKeys.title] as? String else { continue }
            
            guard let image = product[TagsConstants.JSONKeys.image] as? [String:AnyObject] else { continue }
            guard let imageURL = image[TagsConstants.JSONKeys.source] as? String else { continue }
            
            guard let variants = product[TagsConstants.JSONKeys.variants] as? [AnyObject] else { continue }
            
            var productVariants: [Variant] = []
            
            for variant in variants
            {
                guard let variantTitle = variant[TagsConstants.JSONKeys.title] as? String else { continue }
                guard let price = variant[TagsConstants.JSONKeys.price] as? String else { continue }
                guard let inventory = variant[TagsConstants.JSONKeys.inventory] as? Int else { continue }
                guard let weight = variant[TagsConstants.JSONKeys.weight] as? Double else { continue }
                guard let weightUnit = variant[TagsConstants.JSONKeys.weightUnit] as? String else { continue }
                
                productVariants.append(Variant(inventory: inventory, price: price, title: variantTitle, weight: weight, weightUnit: weightUnit))
            }
            
            //store product in dictionary for the appropriate tags
            tagsArray.forEach { (tag) in
                
                if var product = self.productsForTag[tag]
                {
                    product.append(Product(imageURL: imageURL, tags: tagsArray, title: title, variants: productVariants))
                    
                    self.productsForTag[tag] = product
                }
                else
                {
                    self.productsForTag[tag] = [Product(imageURL: imageURL, tags: tagsArray, title: title, variants: productVariants)]
                }
            }
        }
        
        //deleting duplicate tags and sortings tags
        self.tags = Array(NSOrderedSet(array: allTags)) as! [String]
        self.tags = self.tags.sorted {
            $0.localizedStandardCompare($1) == .orderedAscending
        }
    }
}
