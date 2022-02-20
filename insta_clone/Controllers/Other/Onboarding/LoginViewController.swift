//
//  LoginViewController.swift
//  insta_clone
//
//  Created by bany on 09/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
   
   struct Constants {
      static let cornerRadius: CGFloat = 8.0
   }
   
   private let usernameEmailField: UITextField = {
      let field = UITextField()
      field.placeholder = "Username or Email"
      field.returnKeyType = .next
      field.leftViewMode = .always
      field.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
      field.autocapitalizationType = .none
      field.autocorrectionType = .no
      field.layer.masksToBounds = true
      field.layer.cornerRadius = Constants.cornerRadius
      field.backgroundColor = .secondarySystemBackground
      return field
   }()
   
   private let passwordField: UITextField = {
      let field = UITextField()
      field.isSecureTextEntry = true
      field.placeholder = "Password"
      field.returnKeyType = .next
      field.leftViewMode = .always
      field.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
      field.autocapitalizationType = .none
      field.autocorrectionType = .no
      field.layer.masksToBounds = true
      field.layer.cornerRadius = Constants.cornerRadius
      field.backgroundColor = .secondarySystemBackground
      return field
   }()
   
   private let loginButton: UIButton = {
      let button = UIButton()
      button.setTitle("Login", for: .normal)
      button.layer.masksToBounds = true
      button.layer.cornerRadius = Constants.cornerRadius
      button.backgroundColor = .systemBlue
      button.setTitleColor(.white, for: .normal)
      return button
   }()
   
   private let termsButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.label, for: .normal)
      button.setTitle("New user? Create an account", for: .normal)
      return button
   }()
   
   private let privacyButton: UIButton = {
      return UIButton()
   }()
   
   private let createAccountButton: UIButton = {
      return UIButton()
   }()
   
   private let headerView: UIView = {
      let header = UIView()
      header.clipsToBounds = true
      let backgroundImageView = UIImageView.init(image: UIImage.init(named: "thumb"))
      header.addSubview(backgroundImageView)
      return header
   }()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      addSubviews()
      self.view.backgroundColor = .systemBackground
   }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      // assign frame
      
      headerView.frame = CGRect(x: 0,
                                y: view.safeAreaInsets.top,
                                width: view.width,
                                height: view.height / 3)
      
      configureHeaderView()
      
      // add logo
      
      let logo = UIImageView.init(image: UIImage.init(named: "logo_text"))
      headerView.addSubview(logo)
      logo.contentMode = .scaleAspectFit
      logo.frame = CGRect(x: headerView.width / 4.0,
                          y: view.safeAreaInsets.top,
                          width: headerView.width / 2.0,
                          height: headerView.height - view.safeAreaInsets.top)
      
   }
   
   private func configureHeaderView() {
      guard headerView.subviews.count == 1 else {
         return
      }
      
      guard let backgoundView = headerView.subviews.first else { return }
      
      backgoundView.frame = headerView.bounds
      
   }
   
   private func addSubviews() {
      view.addSubview(usernameEmailField)
      view.addSubview(passwordField)
      view.addSubview(loginButton)
      view.addSubview(termsButton)
      view.addSubview(privacyButton)
      view.addSubview(createAccountButton)
      view.addSubview(headerView)
   }
   
   @objc private func didTapLoginButton() {
      
   }
   
   @objc private func didTapTermsButton() {
      
   }
   
   @objc private func didTapPrivacyButton() {
      
   }
   
   @objc private func didTapCreateAccountButton() {
      
   }
   
}
