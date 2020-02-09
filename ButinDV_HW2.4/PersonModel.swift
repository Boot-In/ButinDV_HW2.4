//
//  PersonModel.swift
//  ButinDV_HW2.4
//
//  Created by Dmitriy Butin on 09.02.2020.
//  Copyright © 2020 Dmitriy Butin. All rights reserved.
//
struct Person {
    var login: String
    var password: String
    var firstName: String
    var secondName: String
    var sex: Sex
    var age: Int
    var height: Int
    var address: String
    var maritalStatus: Bool
    var job: String
    var hobbies: String
}

enum Sex: String {
    case male = "👦🏻"
    case female = "👩🏻"
    
    var discription: String {
        switch self {
        case .male:
            return "Мужской"
        case .female:
            return "Женский"
        }
    }
}
