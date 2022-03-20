//
//  ViewController.swift
//  Lesson 2.3_HW1
//
//  Created by Kostya on 14.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var buttonsSV: UIStackView!
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passTF: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.delegate = self
        passTF.delegate = self
    }
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user.person.fullName
            } else if let navigationVC = viewController as? UINavigationController {
                if let aboutVC = navigationVC.topViewController as? AboutViewController {
                    aboutVC.user = user
                }
            }
        }
    }

    @IBAction func logInBtnPressed() {
        if loginTF.text == user.login && passTF.text == user.pass {
            performSegue(withIdentifier: "loginID", sender: nil)
            return
        }
        showLoginFailAnimation()
    }
    
    @IBAction func passBtnPassed() {
        showAlert(title: "Ohhhh no 🙀", message: "Please remember your correct login or password \n\n Current password: \(user.pass)")
    }
    
    @IBAction func loginBtnPassed() {
        showAlert(title: "Something went wrong 🤔", message: "Enter correct login or password \n\n Current Login: \(user.login)")
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passTF.text = ""
        loginTF.text = ""
        loginTF.becomeFirstResponder()
    }
}

//MARK: - Work with keyboard
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passTF.becomeFirstResponder()
            return true
        }
        if textField == passTF {
            logInBtnPressed()
            return true
        }
        return false
    }
}

//MARK: - Private Func
extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "I got it", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func showLoginFailAnimation() {
        self.loginTF.textColor = UIColor.red
        self.passTF.textColor = UIColor.red

        loginTF.center.x -= 3
        passTF.center.x -= 3

        UIView.animate(withDuration: 0.07) {
            UIView.modifyAnimations(withRepeatCount: 2, autoreverses: true) {
                self.loginTF.center.x += 6
                self.passTF.center.x += 6
            }
        } completion: { isFinished in
            self.passTF.text = ""
            self.passTF.textColor = .black
            self.loginTF.textColor = .black
            self.loginTF.center.x -= 3
            self.passTF.center.x -= 3
            
        }
    }
}
