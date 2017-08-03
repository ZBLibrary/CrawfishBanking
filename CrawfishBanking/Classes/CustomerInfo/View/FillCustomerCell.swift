//
//  FillCustomerCell.swift
//  CrawfishBanking
//
//  Created by ZGY on 2017/4/27.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/4/27  下午1:07
//  GiantForJade:  Efforts to do my best
//  Real developers ship.


import UIKit
import DropDown
@objc protocol FillCustomerCellDelagete {
    
    func inputString(_ str:String?)
    
    @objc optional func levelModifyi(_ level: String?)
    
}

class FillCustomerCell: UITableViewCell ,UITextFieldDelegate{

    @IBOutlet weak var nameLb: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var currentModel: FillCustomerModel?
    var delegate: FillCustomerCellDelagete?
    let dropDown2 = DropDown()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameTextField.delegate = self
    }

    func reloadUI(_ model: FillCustomerModel) {
        currentModel = model
        nameLb.text = model.nameStr
        if (model.placeHodlerStr?.contains("Level"))! {

            nameTextField.text = model.placeHodlerStr
            
        } else {
            nameTextField.text = ""
            nameTextField.placeholder = model.placeHodlerStr
        }
        
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if (currentModel?.placeHodlerStr?.contains("Level"))!{
            dropDown2.anchorView = textField
            dropDown2.direction = .any
            dropDown2.bottomOffset = CGPoint(x: 0, y:(dropDown2.anchorView?.plainView.bounds.height)!)
            
            dropDown2.dataSource = ["Level A", "Level B","Level C"]
            
            dropDown2.selectionAction = {[weak self]
                (index: Int, item: String) in
                
                self?.delegate?.levelModifyi!(item)

            }
            dropDown2.show()
            return false
        }
        dropDown2.hide()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        delegate?.inputString(textField.text)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


