//
//  FilesViewControllerSpec.swift
//  CrawfishBanking
//
//  Created by macpro on 2017/5/8.
//  Copyright © 2017年 CrawfishBanking. All rights reserved.
//

import XCTest
import Nimble
import Quick
@testable import CrawfishBanking

class FilesViewControllerSpec: QuickSpec {
    
    override func spec() {

        var filesVc: LoginViewController!
        
        beforeEach {
            
            filesVc = LoginViewController()
            
        }
        
        describe(".viewDidLoad()") { 
            
            beforeEach {
                filesVc.viewDidLoad()
                filesVc.loginView.phoneTextField.text = "15221981520"
                filesVc.loginView.pwdTextField.text = "8768"
            }
            
            it(".loginAction()", closure: { 
                
//                XCTAssertEqual(11, 10, "不等于")
 
                filesVc.loginAction()
                
            })

        }
        
//        describe(".loginAction()") { 
//            
//            beforeEach {
//                filesVc.viewDidLoad()
//                filesVc.loginView.phoneTextField.text = "15221981520"
//                filesVc.loginView.pwdTextField.text = "8768"
//            }
//            
//            it("123", closure: { 
//             
//                filesVc.loginAction()
//                expect(filesVc.loginAction())
//            })
//            
//        }
//        
//        describe(".viewWillDisappear()") {
//            
//            it("跳转吧", closure: { 
//                                
//            })
//            
//        }
        
//        describe("titleView") {
//            
//            beforeEach {
//                
//                filesVc.beginAppearanceTransition(true, animated: false)
//                filesVc.endAppearanceTransition()
//                Print("12")
//            }
//            
//        }
        
    }
 
    
    func testVc() {
        


    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertEqual(12, 12, "没问题")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
