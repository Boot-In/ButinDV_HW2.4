//
//  ViewController.swift
//  ButinDV_HW2.4
//
//  Created by Dmitriy Butin on 09.02.2020.
//  Copyright © 2020 Dmitriy Butin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var person = [Person]()
    var personCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        person.append(ivan)
        person.append(maria)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInButtonAction() {
        let title = "Внимание!"
        let message = "Неверная пара LogIn / Password"
        if checkUser(login: userNameTextField.text!, password: passwordTextField.text!) {
            accessed(count: personCount)
        } else {
        showHint(title: title, message: message)
        }
    }
    
    private func checkUser(login: String, password: String) -> Bool {
        for i in 0..<person.count {
            if login == person[i].login &&
                password == person[i].password {
                personCount = i
                return true
            }
        }
        return false
    }
    
    private func accessed(count: Int) {
        userNameTextField.text = nil
        passwordTextField.text = nil
        
        performSegue(withIdentifier: "goToTabBar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let aboutVC = tabBarController.viewControllers?.first as!
        AboutPerson
        aboutVC.personCount = personCount
        aboutVC.person = person
        
        let hobbyVC = tabBarController.viewControllers?.last as!
        HobbiesPerson
        hobbyVC.personCount = personCount
        hobbyVC.person = person
        
        let jobVC = tabBarController.viewControllers?[1] as!
        JobPerson
        jobVC.personCount = personCount
        jobVC.person = person
        
    }
    
    @IBAction func forgotUserNameButtonAction() {
        let title = "User Name"
        let message = "Если ты парень: Ivan\nЕсли повезло: Maria"
        showHint(title: title, message: message)
    }
    
    @IBAction func forgotPasswordButtonAction() {
        let title = "Подсказка"
        let message = "Иван - durak\nМарья - krasa"
        showHint(title: title, message: message)
    }
    
    private func showHint(title: String, message: String) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default)
         alert.addAction(okAction)
         present(alert, animated: true)
     }
    
}

