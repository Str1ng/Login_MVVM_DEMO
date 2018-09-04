//
//  LoginViewModel.swift
//  Login_MVVM_DEMO
//
//  Created by Str1ng on 2018/9/4.
//  Copyright © 2018年 gmcx. All rights reserved.
//

import Foundation
import UIKit

@objc protocol LoginViewModelDelegate{
    func reloadViews()
    func alertInfo()
    func movtToMainScreen()
}

protocol LoginViewModelInterface {
    
    
    var delegate:LoginViewModelDelegate?{
        get set
    }
    var allThingValid:Bool{get}
    
    func userNameDidChange(text:String?)
    func passwordDidChange(text:String?)
    func toLogin()
}

public class LoginViewModel:NSObject,LoginViewModelInterface{
    func userNameDidChange(text: String?) {

            if text!.isMobile() {
                userNameValid = true
            }else{
                userNameValid = false
            }
    }
    
    func passwordDidChange(text: String?) {
        if (text?.utf8CString.count)! < 6 {
            passwordValid = false
        }else{
            passwordValid = true
        }
    }
    
    func toLogin() {
        if(allThingValid){
            delegate?.alertInfo()
            delegate?.movtToMainScreen()
        }
        else{
            
        }
    }
    
    private var userNameValid = false
    private var passwordValid = false
    var allThingValid:Bool{
        return userNameValid&&passwordValid
    }
    private var userNameText:String?
    private var passwordText:String?
    
    var delegate:LoginViewModelDelegate?
    
}
