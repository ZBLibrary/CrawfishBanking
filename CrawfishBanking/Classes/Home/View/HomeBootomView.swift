//
//  HomeBootomView.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/24.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/24  下午5:28
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

@objc protocol HomeBootomViewDelegate {
    
    func selectedButtonIndex(_ index:NSInteger) -> Void
    
}

class HomeBootomView: UIView {

    weak var delegate: HomeBootomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instanceUI(frame)
        
    }
    
    fileprivate func instanceUI(_ frame:CGRect) {
        
        backgroundColor = UIColor.init(240, g: 240, b: 242, a: 1.0)
        
        var buttonTitle = ["融资申请","查询还款","利息测算","账户管理"]
        
        for i in 0...3 {
            
            let button = UIButton(type: UIButtonType.custom)
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: UIControlState.normal)
            
            let x = CGFloat(40 * (i%2 + 1)) + (Screen_Width - 120.0)/2 * CGFloat(i%2)
            let y = CGFloat(40 * (i/2 + 1)) + (frame.height - 180)/2.0 * CGFloat(i/2)
            
            button.setTitle(buttonTitle[i], for: UIControlState.normal)
            button.frame = CGRect(x:x , y:y, width: (Screen_Width - 120.0)/2, height: (frame.height - 180)/2.0)
//            button.layer.cornerRadius = 10
//            button.layer.borderWidth = 1
//            button.layer.borderColor = UIColor.lightGray.cgColor
//            button.layer.masksToBounds = true
            button.tag = i
            button.addTarget(self, action: #selector(butttonAction(_:)), for: UIControlEvents.touchUpInside)
            
            self.addSubview(button)
        }
        
    }
    
    func butttonAction(_ sender: UIButton) {
        
        delegate?.selectedButtonIndex(sender.tag)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
