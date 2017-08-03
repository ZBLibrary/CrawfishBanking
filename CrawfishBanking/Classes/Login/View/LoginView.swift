//
//  LoginView.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/25.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/25  下午5:13
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import SnapKit

class LoginView: UIView {

    var phoneImage: UIImageView?
    var phoneTextField: UITextField!
    var lineView: UIView!
    var pwdImage: UIImageView?
    var pwdTextField: UITextField!
    var lineView2: UIView!
    var timerBtn:GYTimerButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        instanceUI()
        
    }
    
    fileprivate func instanceUI() {
        
        phoneTextField = UITextField()
        self.addSubview(phoneTextField)
        phoneTextField.placeholder = "请输入手机号"
        //        phoneTextField.borderStyle = .roundedRect
        phoneTextField.keyboardType = .numberPad
        phoneTextField.font = UIFont.systemFont(ofSize: 14.0)
        
        phoneImage = UIImageView()
        self.addSubview(phoneImage!)
        phoneImage?.image = UIImage(named: "login_user")
        
        lineView = UIView()
        self.addSubview(lineView)
        lineView.backgroundColor = UIColor.lightGray
        
        pwdTextField = UITextField()
        self.addSubview(pwdTextField)
        pwdTextField.placeholder = "请输入验证码"
        //        pwdTextField.borderStyle = .roundedRect
        pwdTextField.keyboardType = .numberPad
        pwdTextField.font = UIFont.systemFont(ofSize: 14.0)
        
        pwdImage = UIImageView()
        self.addSubview(pwdImage!)
        pwdImage?.image = UIImage(named: "login_lock")
        
        timerBtn = GYTimerButton(CGRect.zero, timerNumber: 60)
        self.addSubview(timerBtn)
//        timerBtn.layer.cornerRadius = 10.0
//        timerBtn.layer.masksToBounds = true
//        timerBtn.layer.borderWidth = 1
//        timerBtn.layer.borderColor = navBarColor.cgColor
        timerBtn.setTitleColor(navBarColor, for: UIControlState.normal)
        
        lineView2 = UIView()
        self.addSubview(lineView2)
        lineView2.backgroundColor = UIColor.lightGray
        
        phoneImage?.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.leading.equalTo(20)
            make.width.height.equalTo(20)
        })
        
        pwdImage?.snp.makeConstraints({ (make) in
            make.top.equalTo((phoneImage?.snp.bottom)!).offset(30)
            make.leading.equalTo(phoneImage!)
            make.width.height.equalTo(20)
        })
        
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo((phoneImage?.snp.top)!)
            make.leading.equalTo((phoneImage?.snp.trailing)!).offset(10)
            make.trailing.equalTo(-20)
            make.height.equalTo((phoneImage?.snp.height)!)
        }
        
        pwdTextField.snp.makeConstraints { (make) in
            make.top.equalTo((pwdImage?.snp.top)!)
            make.leading.equalTo(phoneTextField.snp.leading)
            make.height.equalTo(phoneTextField.snp.height)
            make.width.equalTo(phoneTextField.snp.width).multipliedBy(0.6)
        }
        
        timerBtn.snp.makeConstraints { (make) in
            make.top.equalTo(pwdTextField.snp.top)
            make.leading.equalTo(pwdTextField.snp.trailing).offset(8)
            make.trailing.equalTo(phoneTextField.snp.trailing)
            make.height.equalTo(phoneTextField.snp.height)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo((phoneImage?.snp.bottom)!).offset(5)
            make.height.equalTo(1)
            make.leading.equalTo((phoneImage?.snp.leading)!)
            make.trailing.equalTo(phoneTextField.snp.trailing)
        }
        
        lineView2.snp.makeConstraints { (make) in
            make.top.equalTo((pwdImage?.snp.bottom)!).offset(5)
            make.height.equalTo(1)
            make.leading.equalTo((pwdImage?.snp.leading)!)
            make.trailing.equalTo(timerBtn.snp.trailing)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    
}
