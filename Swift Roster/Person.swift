//
//  Person.swift
//  Roster App
//
//  Created by John Clem on 6/3/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class Person: NSObject {

    var firstName = String()
    var lastName = String()
    
    var github = String()
    var twitter = String()
    
    var favoriteColor = UIColor()
    var teacher : Bool = false
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
    func tenRandomStudents() -> Person[] {
        var students = Person[]()
        var firstNames = ["Tony", "Alyssa", "George", "Chris", "Reed", "Joanne", "Sally", "James", "Tom", "Frank"]
        var lastNames = ["Danza", "Milano", "Foreman", "Meehan", "Sweeney", "Smith", "Jones", "Franco", "Hanks", "Sinatra"]
        
        for i in 0..firstNames.count {
            var person = Person()
            person.firstName = firstNames[i]
            person.lastName = lastNames[i]
            person.github = "@" + person.fullName().lowercaseString
            person.twitter = person.github
            person.favoriteColor = randomColor()
            students += person
        }
        
        return students
    }
    
    func threeRandomTeachers() -> Person[] {
        var teachers = Person[]()
        var firstNames = ["John", "Taylor", "Brad"]
        var lastNames = ["Clem", "Potter", "Johnson"]
        
        for i in 0..firstNames.count {
            var person = Person()
            person.firstName = firstNames[i]
            person.lastName = lastNames[i]
            person.github = "@" + person.fullName().lowercaseString
            person.twitter = person.github
            person.favoriteColor = randomColor()
            teachers += person
        }
        
        return teachers
    }
    
    func randomColor() -> UIColor {
        var r : CGFloat = random().bridgeToObjectiveC().floatValue
        var g : CGFloat = random().bridgeToObjectiveC().floatValue
        var b : CGFloat = random().bridgeToObjectiveC().floatValue
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

