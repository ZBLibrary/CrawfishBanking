//
//  GYTimerButton.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/25.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/25  下午4:29
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

class GYTimerButton: UIButton {

    var timer: Timer!
    var timeInterval:Int = 0
    var timeSum:Int!
        
    init(_ frame: CGRect,timerNumber:Int) {
        super.init(frame: frame)
        timeInterval = timerNumber
        timeSum = timerNumber
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.setTitle("验证码", for: UIControlState.normal)
        self.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.addTarget(self, action: #selector(GYTimerButton.btnAction), for: .touchUpInside)
    }
    
    func btnAction() {
        self.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GYTimerButton.timerAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    func timerAction() {
        self.setTitle("\(timeInterval)秒", for: UIControlState.normal)
        timeInterval -= 1
        if timeInterval < 0 {
            DispatchQueue.main.async(execute: {
                
                self.setTitle("验证码", for: UIControlState.normal)
                self.timeInterval = self.timeSum
                
            })
            self.isEnabled = true
            timer.invalidate()
            timer = nil
            return
        }
        
    }
    
    deinit {
        timer.invalidate()
        timer = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}
