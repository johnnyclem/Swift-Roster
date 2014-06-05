//
//  ViewController.swift
//  Swift Roster
//
//  Created by John Clem on 6/3/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var teachers = Person[]()
    var students = Person[]()

    @IBOutlet var tableView : UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedDictionary =  NSKeyedUnarchiver.unarchiveObjectWithFile(self.pathForPlistArchive()) as? NSDictionary {
            self.teachers = savedDictionary.objectForKey("teachers") as Person[]
            self.students = savedDictionary.objectForKey("students") as Person[]
            self.loadImagesForPeeps()
        }
        else {
            self.teachers = Person().threeRandomTeachers()
            self.students = Person().tenRandomStudents()
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.saveData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return teachers.count
            default:
                return students.count
        }
    }

    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        switch section {
        case 0:
            return "Teachers"
        default:
            return "Students"
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        var person : Person
        switch indexPath.section {
        case 0:
            person = teachers[indexPath.row]
        default:
            person = students[indexPath.row]
        }

        cell.textLabel.text = person.fullName()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        println("Preparing For Segue")
        if segue.identifier == "showDetail" {
            var detailVC = segue.destinationViewController as DetailViewController
            let section = tableView.indexPathForSelectedRow().section
            let row = tableView.indexPathForSelectedRow().row
            var person : Person
            switch tableView.indexPathForSelectedRow().section {
            case 0:
                person = teachers[row]
            default:
                person = students[row]
            }

            detailVC.setSelectedPerson(person)
        }
    }
    
    func saveData(){
        var saveDictionary = ["teachers" : self.teachers, "students" : self.students]
        NSKeyedArchiver.archiveRootObject(saveDictionary, toFile: self.pathForPlistArchive())
    }
    
    func pathForPlistArchive() ->String {
        let documentsDirectory = self.pathForDocumentDirectory()
        let filePath = documentsDirectory + "/Archive"
        println(filePath)
        return filePath
    }
    
    func pathForDocumentDirectory() ->String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as String[]
        let documentsDirectory = paths[0]
        println(documentsDirectory)
        return documentsDirectory
    }
    
    func loadImagesForPeeps(){
        for teacher in teachers {
            if teacher.hasImage {
                let filePath = self.pathForDocumentDirectory() + "/\(teacher.fullName()).png"
                var pngData = NSData(contentsOfFile: filePath)
                var image = UIImage(data: pngData)
            teacher.image = image
            }
            for student in students {
                if student.hasImage {
                    let filePath = self.pathForDocumentDirectory() + "/\(student.fullName()).png"
                    var pngData = NSData(contentsOfFile: filePath)
                    var image = UIImage(data: pngData)
                    student.image = image
                }
        }
    }
}
    
}

