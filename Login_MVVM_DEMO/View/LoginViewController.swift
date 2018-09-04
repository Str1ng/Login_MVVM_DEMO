//
//  LoginViewController.swift
//  Login_MVVM_DEMO
//
//  Created by Str1ng on 2018/9/4.
//  Copyright © 2018年 gmcx. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    @IBOutlet weak var toLoginButton:UIButton!
    
    var loginViewModel:LoginViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel = LoginViewModel()
        loginViewModel.delegate  = self
        userNameField.addTarget(self, action: #selector(userNameChange(field:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(passwordChange(field:)), for: .editingChanged)
    }
    
    @objc func userNameChange(field:UITextField){
        loginViewModel.userNameDidChange(text: field.text!)
    }
    
    @objc func passwordChange(field:UITextField){
        loginViewModel.passwordDidChange(text: field.text!)
    }
    
    @IBAction func toLoginAction(sender:AnyObject){
        loginViewModel.toLogin()
    }
}

extension LoginViewController:LoginViewModelDelegate{
    func reloadViews() {
        
    }
    
    func alertInfo() {
        print("Valid success,toLogin!")
    }
    
    func movtToMainScreen() {
        let mainView=UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") 
        self.present(mainView, animated: true, completion: nil)
    }
    
    
}
