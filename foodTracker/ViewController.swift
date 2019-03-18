//
//  ViewController.swift
//  foodTracker
//
//  Created by Haseena Gul on 18/03/2019.
//  Copyright © 2019 lecture. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
   
    
    //MARK: - properties

    @IBOutlet weak var mealName: UILabel!
    
    @IBOutlet weak var entermealNameTextField: UITextField!
    
    @IBOutlet weak var photoimageView: UIImageView!
    
    
    
    //MARK: - action .
    
    @IBAction func setTextButton(_ sender: UIButton) {
        
       mealName.text = "Default Text"
    }
    
    
    @IBAction func selectImageFromPhoto(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        entermealNameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
        
        }
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks
        entermealNameTextField.delegate = self
        // Make sure ViewController is notified when the user picks an image.
        
        
     
    }
                  //MARK: - UITextFieldDelegate
    
    

    //methods for textField delegate.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide the keyboard.
       textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        entermealNameTextField.text = textField.text
        
    }
    
    //MARK: - set the UIImage picker  controller delegate method.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
       guard let  selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
        fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
         // Set photoImageView to display the selected image.
        photoimageView.image = selectedImage
        
        //Dismiss the picker
        dismiss(animated: true, completion: nil)
}

}

