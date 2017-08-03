//
//  GYConst.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/24.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/24  下午5:58
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit


let Screen_Width = UIScreen.main.bounds.size.width

let Screen_Height = UIScreen.main.bounds.size.height

/// navBar颜色
let navBarColor = UIColor.init(248.0, g: 125.0, b: 92.0, a: 1.0)

enum LoanState {
    
    case Checking
    case CheckSuccess
    case updated
    
}

var appDelegate: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}



