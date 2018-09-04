//
//  StringExtension.swift
//  Login_MVVM_DEMO
//
//  Created by Str1ng on 2018/9/4.
//  Copyright © 2018年 gmcx. All rights reserved.
//

import Foundation
extension String{
    func isMobile() -> Bool {
        if((self.cString(using: String.Encoding.utf8)?.count)!>=11){
            let mobile = "^((13[0-9])|(14[0-9])|(15[0-9])|(17[0,0-9])|(18[0,0-9])|(19[0,0-9]))\\d{8}$"
            let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
            if (regextestmobile.evaluate(with: self) == true)
            {
                return true
            }
            else
            {
                return false
            }
        }
        else{
            return false
        }
    }
}
