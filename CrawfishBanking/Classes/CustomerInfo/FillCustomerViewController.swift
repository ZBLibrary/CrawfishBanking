//
//  FillCustomerViewController.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/27.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/27  上午10:38
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import WHC_KeyboardManager
import DropDown

enum LoanType {
    case ToJion
    case Finance
}
class FillCustomerViewController: GYBaseViewController {
    
    //MARK: - Attributes
    let dropDown = DropDown()
    var activityView: GYIndicatorView!
    var loadType: LoanType!
    var tableView: UITableView!
    
    var dataArr:[FillCustomerModel] = [] {
        
        didSet {
            tableView.reloadData()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        initUI()
        let configuration = WHC_KeyboardManager.share.addMonitorViewController(self)
        configuration.enableHeader = true
        
    }
    
    //MARK: - Override
    
    
    //MARK: - Initial Methods
    fileprivate func initUI() {
        
        title = "填写客户信息"
        loadType = LoanType.Finance
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem(nil, title: "跳过", target: self, action: #selector(FillCustomerViewController.rightItemAction))
        tableView = UITableView(frame: view.frame)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

        let headView = UINib.init(nibName: "FillHeadView", bundle: nil).instantiate(withOwner: nil, options: nil).last as! FillHeadView
        headView.frame = CGRect(x: 0, y: 0, width: Screen_Width, height: 40)
        headView.changeType.addTarget(self, action: #selector(changeTypeAction(_:)), for: UIControlEvents.touchUpInside)
        tableView.tableHeaderView = headView
        let bootomView = UIView()
        
        bootomView.frame = CGRect(x: 0, y: 0, width: Screen_Width, height: 45)
        bootomView.addSubview(bootomBtn)
        
        tableView.tableFooterView = bootomView
        dropDown.anchorView = headView.textField
        dropDown.direction = .any
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)

        dropDown.dataSource = ["加盟贷", "贷款融资"]

        dropDown.selectionAction = {[weak self]
            (index: Int, item: String) in

            headView.textField.text = item
            
            switch index {
            case 0:
                self?.loadType = LoanType.ToJion
            case 1:
                self?.loadType = LoanType.Finance
            default:
                break
            }
            self?.initData()
        }

        tableView.register(UINib.init(nibName: "FillCustomerCell", bundle: nil), forCellReuseIdentifier: "FillCustomerCellID")
        initData()
        
//        activityView = GYIndicatorView.init(CGRect(x: 50, y: 100, width: 60, height: 60), tintColor: UIColor.blue)
//        view.addSubview(activityView)
//
//        activityView.startAnimating()
        
        
    }
    
    //MARK: - Delegate
    
    
    //MARK: - Target Methods
    func rightItemAction() {
        
        appDelegate.window?.rootViewController = GYNavigationController(rootViewController: HomeViewController())
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func changeTypeAction(_ sender: UIButton) {
        dropDown.show()
    
    }
    
    func sucessBtnAction() {
        
//        self.present(GYNavigationController(rootViewController: ConfirmViewController()), animated: false, completion: nil)
        
        self.present(ConfirmViewController(), animated: false, completion: nil)
        
    }
    
    //MARK: - Notification Methods
    
    
    //MARK: - KVO Methods
    
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    
    
    //MARK: - Privater Methods
    fileprivate func initData() {
        dataArr.removeAll()
        
        let one = FillCustomerModel(nameStr: "公司名称", placeHodlerStr: "单行输入")
        let two = FillCustomerModel(nameStr: "申请人姓名", placeHodlerStr: "请填写公司法人")
        let three = FillCustomerModel(nameStr: "申请人手机", placeHodlerStr: "单行输入")
        var four = FillCustomerModel()
        if loadType == LoanType.Finance {
            
            four  = FillCustomerModel(nameStr: "客户编号", placeHodlerStr: "单行输入")
        } else {
            four = FillCustomerModel(nameStr: "申请加盟等级", placeHodlerStr: "Level A")
        }
        
        dataArr.append(one)
        dataArr.append(two)
        dataArr.append(three)
        dataArr.append(four)
    
    }
    
    //MARK: - Setter Getter Methods
    
    private lazy var  bootomBtn: UIButton = {
        
        let  btn = UIButton.init(CGRect(x: 80, y: 0, width: Screen_Width - 160, height: 40), imageName: nil, title: "完成,并核算额度", target: self, action: #selector(FillCustomerViewController.sucessBtnAction))
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.borderWidth = 1.0
        
       return btn
    }()
    
    //MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    deinit {
        Print(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FillCustomerViewController: UITableViewDelegate,UITableViewDataSource,FillCustomerCellDelagete {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FillCustomerCellID") as! FillCustomerCell
        cell.delegate = self
        cell.selectionStyle = .none
        let model = dataArr[indexPath.row] as FillCustomerModel
        
        cell.reloadUI(model)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }
    
    //MARK: -  FillCustomerCellDelagete
    
    func inputString(_ str: String?) {
        Print(str)
    }
    
    func levelModifyi(_ level: String?) {

        dataArr[3] = FillCustomerModel(nameStr: "申请加盟等级", placeHodlerStr: level)
    }
}
