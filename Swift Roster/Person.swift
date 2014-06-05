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
    
    var image : UIImage? = UIImage()
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
    init() {
        self.image = UIImage(named: "Photo-Video-slr-camera-icon")
    }
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
//    convenience init() {
//        self.init(firstName: "Given Name", lastName: "Surname")
//        self.image = UIImage(named: "Photo-Video-slr-camera-icon")
//    }
    
    func tenRandomStudents() -> Person[] {
        var students   = Person[]()
        var firstNames = ["Tony", "Alyssa", "George", "Chris", "Reed", "Joanne", "Sally", "James", "Tom", "Frank"]
        var lastNames  = ["Danza", "Milano", "Foreman", "Meehan", "Sweeney", "Smith", "Jones", "Franco", "Hanks", "Sinatra"]
        
        
        for i in 0..firstNames.count {
            var person = Person(firstName: firstNames[i], lastName: lastNames[i])
            person.github = "@" + person.fullName().lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "", options: nil, range: nil)
            person.twitter = person.github
            person.favoriteColor = randomColor()
            students += person
        }
        
        return students
    }
    
    func threeRandomTeachers() -> Person[] {
        var teachers   = Person[]()
        var firstNames = ["John", "Taylor", "Brad"]
        var lastNames  = ["Clem", "Potter", "Johnson"]
        
        for i in 0..firstNames.count {
            var person               = Person()
                person.firstName     = firstNames[i]
                person.lastName      = lastNames[i]
                person.github        = "@" + person.fullName().lowercaseString
                person.twitter       = person.github
                person.favoriteColor = randomColor()
          
            teachers += person
        }
        
        return teachers
    }
  
  
    func randomColor() -> UIColor {
        let r = random().bridgeToObjectiveC().floatValue as CGFloat
        let g = random().bridgeToObjectiveC().floatValue as CGFloat
        let b = random().bridgeToObjectiveC().floatValue as CGFloat
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

