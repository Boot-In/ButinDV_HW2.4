//
//  AboutPerson.swift
//  ButinDV_HW2.4
//
//  Created by Dmitriy Butin on 09.02.2020.
//  Copyright © 2020 Dmitriy Butin. All rights reserved.
//

import UIKit

class AboutPerson: UIViewController {

    @IBOutlet weak var nameInfoLabel: UILabel!
    @IBOutlet weak var otherInfoLabel: UILabel!
    
    var person = [Person]()
    var personCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameInfoLabel.text = "\(person[personCount].firstName) "
        nameInfoLabel.text? += person[personCount].secondName
        
        loadMoreInfo()
    }
    
    func loadMoreInfo() {
        otherInfoLabel.text = "Пол: \(person[personCount].sex.rawValue) "
        otherInfoLabel.text? += "\(person[personCount].sex.discription)\n"
        otherInfoLabel.text? += "Возраст: \(person[personCount].age)\n"
        otherInfoLabel.text? += "Рост: \(person[personCount].height) см.\n"
        otherInfoLabel.text? += "Семейное положение: "
        if person[personCount].maritalStatus {
            otherInfoLabel.text? += "Состоит в отношениях\n"
        } else {
            otherInfoLabel.text? += "В браке не состоит\n"
        }
        otherInfoLabel.text? += "Адрес: \(person[personCount].address)"
    }
    
    
    @IBAction func logOutButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    

}
