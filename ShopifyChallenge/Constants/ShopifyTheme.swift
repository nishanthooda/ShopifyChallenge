//
//  ShopifyTheme.swift
//  ShopifyChallenge
//
//  Created by Nishant Hooda on 2018-09-12.
//  Copyright © 2018 Nishant Hooda. All rights reserved.
//

import Foundation
import UIKit

public struct ShopifyTheme
{
    public struct color
    {
        static let lighterGreen = #colorLiteral(red: 0.8901960784, green: 0.9450980392, blue: 0.8745098039, alpha: 1)
        static let lightGreen = #colorLiteral(red: 0.7333333333, green: 0.8980392157, blue: 0.7019607843, alpha: 1)
        static let green = #colorLiteral(red: 0.3137254902, green: 0.7215686275, blue: 0.2352941176, alpha: 1)
        static let darkGreen = #colorLiteral(red: 0.06274509804, green: 0.5019607843, blue: 0.262745098, alpha: 1)
        static let darkerGreen = #colorLiteral(red: 0.09019607843, green: 0.2117647059, blue: 0.1882352941, alpha: 1)
        static let text = #colorLiteral(red: 0.2549019608, green: 0.3098039216, blue: 0.2431372549, alpha: 1)
    }
    
    public struct Spacing
    {
        static let xxxs: CGFloat = 1
        static let xxs: CGFloat = 2
        static let xs: CGFloat = 5
        static let s: CGFloat = 10
        static let m: CGFloat = 15
        static let l: CGFloat = 20
        static let xl: CGFloat = 25
        static let xxl: CGFloat  = 30
        static let xxxl: CGFloat  = 35
        static let xxxxl: CGFloat = 40
    }
    
    public struct font
    {
        static let xs = UIFont(name: "Avenir-Light", size: 10)!
        static let s = UIFont(name: "Avenir-Light", size: 12)!
        static let m = UIFont(name: "Avenir-Light", size: 16)!
        static let l = UIFont(name: "Avenir-Light", size: 20)!
        static let xl = UIFont(name: "Avenir-Light", size: 24)!
        static let xxl = UIFont(name: "Avenir-Light", size: 34)!
        static let xxxl = UIFont(name: "Avenir-Light", size: 44)!
    }
}

extension UIFont
{
    func withTraits(traits: UIFontDescriptorSymbolicTraits) -> UIFont
    {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont
    {
        return withTraits(traits: .traitBold)
    }
}
