//
//  LoginViewController.swift
//  insta_clone
//
//  Created by bany on 09/02/2022.
//

import UIKit
import SafariServices

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
      field.layer.borderWidth = 1.0
      field.layer.borderColor = UIColor.secondarySystemBackground.cgColor
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
      field.returnKeyType = .continue
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
      button.setTitleColor(.secondaryLabel, for: .normal)
      button.setTitle("Terms of service", for: .normal)
      return button
   }()
   
   private let privacyButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.secondaryLabel, for: .normal)
      button.setTitle("Privacy Policy", for: .normal)
      return button
   }()
   
   private let createAccountButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.label, for: .normal)
      button.setTitle("New user? Create an account", for: .normal)
      return button
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
      
      loginButton.addTarget(self,
                            action: #selector(didTapLoginButton),
                            for: .touchUpInside)
      
      createAccountButton.addTarget(self,
                                    action: #selector(didTapCreateAccountButton),
                                    for: .touchUpInside)
      
      termsButton.addTarget(self,
                            action: #selector(didTapTermsButton),
                            for: .touchUpInside)
      
      privacyButton.addTarget(self,
                              action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
      
      usernameEmailField.delegate = self
      passwordField.delegate = self
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
      
      usernameEmailField.frame = CGRect(x: 25,
                                        y: headerView.bottom + 40,
                                        width: view.width - 50,
                                        height: 52)
      
      passwordField.frame = CGRect(x: 25,
                                   y: usernameEmailField.bottom + 10,
                                   width: view.width - 50,
                                   height: 52)
      
      
      loginButton.frame = CGRect(x: 25,
                                 y: passwordField.bottom + 10,
                                 width: view.width - 50,
                                 height: 52)
      createAccountButton.frame = CGRect(x: 25,
                                         y: loginButton.bottom + 10,
                                         width: view.width - 50,
                                         height: 52)
      
      termsButton.frame = CGRect(x: 10,
                                 y: view.height - view.safeAreaInsets.bottom - 100,
                                 width: view.width - 20,
                                 height: 50)
      
      privacyButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 50,
                                   width: view.width - 20,
                                   height: 50)
      
      configureHeaderView()
      
   }
   
   private func configureHeaderView() {
      guard headerView.subviews.count == 1 else {
         return
      }
      
      guard let backgoundView = headerView.subviews.first else { return }
      
      backgoundView.frame = headerView.bounds
      
      let logo = UIImageView.init(image: UIImage.init(named: "logo_text"))
      headerView.addSubview(logo)
      logo.contentMode = .scaleAspectFit
      logo.frame = CGRect(x: headerView.width / 4.0,
                          y: view.safeAreaInsets.top,
                          width: headerView.width / 2.0,
                          height: headerView.height - view.safeAreaInsets.top)
      
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
      passwordField.resignFirstResponder()
      usernameEmailField.resignFirstResponder()
      
      guard let username = usernameEmailField.text, let pass = passwordField.text, !username.isEmpty, !pass.isEmpty else { return }
      
      // login functionally
   }
   
   @objc private func didTapTermsButton() {
      guard let url = URL(string: "https://help.instagram.com/581066165581870") else { return }
      let viewController = SFSafariViewController(url: url)
      present(viewController, animated: true, completion: nil)
   }
   
   @objc private func didTapPrivacyButton() {
      guard let url = URL(string: "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0") else { return }
      let viewController = SFSafariViewController(url: url)
      present(viewController, animated: true, completion: nil)
   }
   
   @objc private func didTapCreateAccountButton() {
      let viewController = RegistrasionViewController()
      present(viewController, animated: true, completion: nil)
   }
   
}

extension LoginViewController: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == usernameEmailField {
         passwordField.becomeFirstResponder()
      } else if textField == passwordField {
         didTapLoginButton()
      }
      return true
   }
}
