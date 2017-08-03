//
//  Tools.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/26.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/26  下午1:07
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import PopupDialog
import SCLAlertView
class Tools {

    
    /// 检测手机号是否合法
    ///
    /// - Parameter string: string description
    /// - Returns:  Bool
    class func checkPhoneNumber(_ string: String) -> Bool {
        
        let pattern = "^1[3|4|5|7|8][0-9]\\d{8}$"
        let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
        
        let res = regex.matches(in: string, options: NSRegularExpression.MatchingOptions(rawValue:0), range: NSRange(location: 0, length: string.characters.count))
        
        if res.count > 0 {
            return true
        }
        
        return false
        
    }
    
    
}


/// 确定取消alertView
///
/// - Parameters:
///   - title: title description
///   - subTitle: subTitle description
///   - actionSure: actionSure description
///   - actionCancle: actionCancle description
public func gyShowInfoMessgae(_ title: String?,subTitle: String, actionSure:@escaping () -> Void,actionCancle: @escaping () -> Void) {
    
    let appearance = SCLAlertView.SCLAppearance(
        showCloseButton: false
    )
    
    let alertView = SCLAlertView(appearance: appearance)
    
    alertView.addButton("确定", action:actionSure)
    
    
    alertView.addButton("取消", action:actionCancle)
    
    alertView.showInfo(title ?? "温馨提示", subTitle: subTitle)
    

    
}

public func gyshowMessage(_ title: String?,message:String) -> PopupDialog{
    
    let popUp = PopupDialog(title: title ?? "温馨提示", message: message)
    
    let buttonOne = CancelButton(title: "取消") {
        print("You canceled the car dialog.")
    }
    
    let buttonTwo = DefaultButton(title: "确定") {
        print("What a beauty!")
    }

    popUp.addButtons([buttonOne,buttonTwo])
    
    return popUp
}
