//
//  JobPerson.swift
//  ButinDV_HW2.4
//
//  Created by Dmitriy Butin on 09.02.2020.
//  Copyright © 2020 Dmitriy Butin. All rights reserved.
//

import UIKit

class JobPerson: UIViewController {

    @IBOutlet weak var nameInfoLabel: UILabel!
    @IBOutlet weak var otherInfoLabel: UILabel!
    
    var person = [Person]()
    var personCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameInfoLabel.text = "\(person[personCount].firstName) "
        nameInfoLabel.text? += person[personCount].secondName
        
        loadMoreInfo()
    }
    
    func loadMoreInfo() {
        otherInfoLabel.text = "Работа\n\n\(person[personCount].job)"
    }
    
}
