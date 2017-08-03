//
//  HomeViewController.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/24.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/24  下午5:27
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

class HomeViewController: GYBaseViewController {
    
    //MARK: - Attributes
    
    var gyBanner: GYBanner!
    var bootomView: HomeBootomView!
    var dataList:[GYBannerModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "小龙虾金融服务"
        
//        self.present(LoginViewController(), animated: false, completion: nil)
        
        instanceDatas()
        initUI()
        
    }
    
    //MARK: - Override
    
    
    //MARK: - Initial Methods
    
    fileprivate func initUI() {
        
        gyBanner = GYBanner(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: 200), imageHandle: { (index) in
            Print(index)
        })
        gyBanner.reloadGYBanner(dataList)
        view.addSubview(gyBanner)

        bootomView = HomeBootomView(frame: CGRect(x: 0, y: 200, width: view.bounds.size.width, height: Screen_Height - 200))
        bootomView.delegate = self
        view.addSubview(bootomView)
        
    }
    /**
     模拟数据
     */
    fileprivate func instanceDatas(){
        
        for i in 1...6 {
            
            let product = GYBannerModel()
            product.imageNamed = String(i) + ".jpg"
            
            product.labelText = String(i)
            dataList.append(product)
            
        }
        
    }
    
    //MARK: - Delegate
    
    
    //MARK: - Target Methods
    
    
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
        Print("申请销毁了")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: HomeBootomViewDelegate {
    
    func selectedButtonIndex(_ index: NSInteger) {
        
        switch index {
        case 0:
            navigationController?.pushViewController(SubmitViewController(), animated: true)
        default: break
            
        }
        
    }
    
}
