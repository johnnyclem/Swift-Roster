//
//  ViewController.swift
//  Swift Roster
//
//  Created by John Clem on 6/3/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var teachers = Person[]()
    var students = Person[]()

    @IBOutlet var tableView : UITableView

    override func viewDidLoad() {
        super.viewDidLoad()
        teachers = Person().threeRandomTeachers()
        students = Person().tenRandomStudents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // #pragma mark - Table View
    
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


}

