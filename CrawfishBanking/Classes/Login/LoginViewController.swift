//
//  LoginViewController.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/25.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/25  下午2:17
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import SCLAlertView
class LoginViewController: GYBaseViewController {
    
    //MARK: - Attributes
    var loginView: LoginView!
    
    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
    
    }
    
    //MARK: - Override
    
    
    //MARK: - Initial Methods
    
    fileprivate func initUI() {
        
        loginView = LoginView(frame: CGRect(x: Screen_Width * 0.1, y: 200, width: Screen_Width * 0.8, height: 120))
        view.addSubview(loginView)
        
        loginBtn = UIButton(frame: CGRect(x: Screen_Width * 0.1 + 20, y: 350, width: Screen_Width * 0.8 - 40, height: 40))
        loginBtn.setTitle("登录", for: UIControlState.normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        loginBtn.setTitleColor(navBarColor, for: UIControlState.normal)
        loginBtn.layer.cornerRadius = 15.0
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = navBarColor.cgColor
        view.addSubview(loginBtn)
        
        loginBtn.addTarget(self, action: #selector(LoginViewController.loginAction), for: UIControlEvents.touchUpInside)
        
    }
    
    
    //MARK: - Delegate
    
    
    //MARK: - Target Methods

    func loginAction() {
//        sleep(10)
        loginView.phoneTextField.resignFirstResponder()
        loginView.pwdTextField.resignFirstResponder()
        let isPhone = Tools.checkPhoneNumber(loginView.phoneTextField.text!)
        
        
        let vc =  LoginNoneInfoVc(nibName: "LoginNoneInfoVc", bundle: nil)
        self.present(vc, animated: true, completion: nil)
        return
        if !isPhone {
            gyShowInfoMessgae(nil, subTitle: "请输入正确的手机号", actionSure: { 
                
            }, actionCancle: { 
                
            })
        
            return
        }

    }
    //MARK: - Notification Methods
    
    
    //MARK: - KVO Methods
    
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    
    
    //MARK: - Privater Methods
    
    
    //MARK: - Setter Getter Methods
    
    
    //MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    deinit {
       Print("销毁了")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
