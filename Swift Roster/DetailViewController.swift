//
//  DetailViewController.swift
//  Swift Roster
//
//  Created by John Clem on 6/3/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedPerson = Person()

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = selectedPerson.fullName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setSelectedPerson(person : Person) {
        selectedPerson = person
    }

}
