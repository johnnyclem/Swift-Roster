//
//  DetailViewController.swift
//  Swift Roster
//
//  Created by John Clem on 6/3/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var selectedPerson = Person()
    @IBOutlet var twitterTextField : UITextField
    @IBOutlet var githubTextField : UITextField
    @IBOutlet var imageView : UIImageView
    
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageTap = UITapGestureRecognizer(target: self, action: NSSelectorFromString("imagePressed"))
        self.imageView.addGestureRecognizer(imageTap)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = selectedPerson.fullName()
        self.twitterTextField.text = selectedPerson.twitter
        self.githubTextField.text = selectedPerson.github
        
        if self.selectedPerson.hasImage {
        self.imageView.image = selectedPerson.image
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectedPerson.twitter = self.twitterTextField.text
        self.selectedPerson.github = self.githubTextField.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setSelectedPerson(person : Person) {
        selectedPerson = person
    }
    
    func imagePressed(){
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!,
        didFinishPickingMediaWithInfo info: NSDictionary!){
            let originalImage = info[UIImagePickerControllerOriginalImage] as UIImage
            self.imageView.image = originalImage
            self.selectedPerson.image = originalImage
            self.selectedPerson.hasImage = true
            self.saveImageToDocumentsDirectory(originalImage)
            self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveImageToDocumentsDirectory(image : UIImage) {
        var pngData = UIImagePNGRepresentation(image)
        let filePath = self.pathForDocumentDirectory() + "/\(self.selectedPerson.fullName()).png"
        pngData.writeToFile(filePath, atomically: true)
    }
    
    func pathForDocumentDirectory() ->String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as String[]
        let documentsDirectory = paths[0]
        println(documentsDirectory)
        return documentsDirectory
    }
}
