//
//  LeftListViewController.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/5/3.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/5/3  上午10:04
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

@objc protocol LeftListViewControllerDelegate {
    func sendTagToright(_ tag: Int)
}

class LeftListViewController: UIViewController {
    
    //MARK: - Attributes
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    weak var delegate: LeftListViewControllerDelegate?
    var currentBtn: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()

        let frame1 = btn1.titleLabel?.frame
        let line = CALayer()
        line.backgroundColor = UIColor.init(85, g: 36, b: 251, a: 1.0).cgColor
        line.frame = CGRect(x:0, y: (frame1?.maxY)! + 3, width: 80 , height: 2)
        
        line.name = "lineLayer"
        btn1.layer.addSublayer(line)
        currentBtn = btn1
    }
    
    //MARK: - Override
    
    
    //MARK: - Initial Methods
    
    
    //MARK: - Delegate
    
    
    //MARK: - Target Methods
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        if currentBtn == sender {
            return
        }
        
        if currentBtn?.layer.sublayers != nil {
            let arr:NSArray = (currentBtn!.layer.sublayers as NSArray?)!
            arr.enumerateObjects({ (subLayer, _, _) in
                
                let layer: CALayer = subLayer as! CALayer
                if layer.name == "lineLayer" {
                    layer.removeFromSuperlayer()
                }
                
            })
        }
       
        currentBtn = sender
        let frame1 = sender.titleLabel?.frame
        let line = CALayer()
        line.backgroundColor = UIColor.init(85, g: 36, b: 251, a: 1.0).cgColor
        line.frame = CGRect(x:0, y: (frame1?.maxY)! + 3, width: sender.frame.width , height: 2)

        line.name = "lineLayer"
        sender.layer.addSublayer(line)
    
        delegate?.sendTagToright(sender.tag)
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
