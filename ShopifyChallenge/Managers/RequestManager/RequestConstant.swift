//
//  RequestConstant.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation

public enum RequestError: Swift.Error
{
    /// Unable to generate a URL given the url string.
    case invalidURL
    /// Async session task failed with error.
    case errorNotNil
    /// Async session task received a response with invalid HTTP response status code.
    case statusCode
    /// Unable to serialize JSON object to data for HTTP request body.
    case serializeJSON
    /// Unable to deserialize JSON object from returned data.
    case deserializeJSON
    /// Async session task failed to receive data.
    case missingData
    /// The received data describes an error.
    case invalidData
    /// Invalid time
    case invalidTime
    /// Needs update
    case updateRequired
}
