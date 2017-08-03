//
//  UIColor+Extension.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/25.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/25  上午10:19
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

extension UIColor {
    
    
    /// 返回颜色
    ///
    /// - Parameters:
    ///   - r: r description
    ///   - g: g description
    ///   - b: b description
    ///   - a: a description
    public convenience init(_ r:CGFloat,g:CGFloat,b:CGFloat,a: CGFloat) {
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
        
    }
    
}
