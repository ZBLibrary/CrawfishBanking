//
//  FinancingViewController.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/5/2.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/5/2  下午3:03
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

class FinancingViewController: GYBaseBackViewController {
    
    //MARK: - Attributes
    
    var letfList: LeftListViewController!
    var rightView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的申请"

        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.init(85, g: 36, b: 251, a: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        self.navigationController?.navigationBar.isTranslucent = false
        automaticallyAdjustsScrollViewInsets = false
        
        letfList = LeftListViewController(nibName: "LeftListViewController", bundle: nil)
        letfList.delegate = self
        letfList.view.frame = CGRect(x: 0, y: 0, width: 80, height: Screen_Height)
        view.addSubview(letfList.view)
        
        rightView = UIView(frame: CGRect(x: 80, y: 0, width: Screen_Width - 80, height: Screen_Height))
        view.addSubview(rightView)
        let request = RequestVc()
        
        rightView.addSubview(request.view)
        
        
    }
    
    //MARK: - Override
    
    override func backAction() {
        self.dismiss(animated: false, completion: nil)
    }
    //MARK: - Initial Methods
    
    
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FinancingViewController: LeftListViewControllerDelegate {
    
    func sendTagToright(_ tag: Int) {
        
        rightView.subviews[0].removeFromSuperview()
        switch tag {
        case 666:
            
            let request = RequestVc()
            
            rightView.addSubview(request.view)
            break
        case 777:
            let request = ReviewVc()
            
            rightView.addSubview(request.view)
            break
        case 888:
            let request = ContractVc()
            
            rightView.addSubview(request.view)
            
            break
        case 999:
            break
        case 555:
            break
        default:
            break
        }
        
    }
    
}
