//
//  ShopifyRequest.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation

open class ShopifyRequest
{
    public static let shared: ShopifyRequest = ShopifyRequest()
    
    public typealias requestCallBack = (Data?, Error?) -> Void
    
    public func getRequest(urlString: String, callback: @escaping requestCallBack) -> URLSessionTask?
    {
        guard let url = URL(string: urlString) else
        {
            print ("Invalid request URL path: \(urlString)")
            callback(nil, RequestError.invalidURL)
            return nil
        }
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let response = response
            {
                print(response)
            }
            
            guard error == nil else
            {
                print("Request failed: \(urlString)")
                print(error!)
                callback(nil, RequestError.errorNotNil)
                return
            }
            
            guard data != nil else
            {
                print("Request failed: missing data")
                callback(nil, RequestError.missingData)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode < 200 || httpResponse.statusCode >= 300
            {
                print("Request failed Server Error")
                callback(data, RequestError.statusCode)
            }
            else
            {
                print("Got the data")
                
                callback(data, nil)
            }
        }
        session.resume()
        
        return session
    }
    
}
