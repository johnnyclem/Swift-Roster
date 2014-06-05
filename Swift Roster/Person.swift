//
//  Person.swift
//  Roster App
//
//  Created by John Clem on 6/3/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {

    var firstName = String()
    var lastName = String()
    
    var github = String()
    var twitter = String()
    
    var favoriteColor = UIColor()
    var teacher = false
    
    var image : UIImage?
    var hasImage = false
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    convenience init() {
        self.init(firstName: "Given Name", lastName: "Surname")
    }
    
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
    
    init(coder aDecoder: NSCoder!) {
        self.firstName       = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName        = aDecoder.decodeObjectForKey("lastName") as String
        self.github          = aDecoder.decodeObjectForKey("github") as String
        self.twitter         = aDecoder.decodeObjectForKey("twitter") as String
        self.favoriteColor   = aDecoder.decodeObjectForKey("favoriteColor") as UIColor
        self.teacher         = aDecoder.decodeObjectForKey("teacher") as Bool
        self.hasImage        = aDecoder.decodeObjectForKey("hasImage") as Bool
  }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(self.github, forKey: "github")
        aCoder.encodeObject(self.twitter, forKey: "twitter")
        aCoder.encodeObject(self.favoriteColor, forKey: "favoriteColor")
        aCoder.encodeObject(self.teacher, forKey: "teacher")
        aCoder.encodeObject(self.hasImage, forKey: "hasImage")
    }
}

