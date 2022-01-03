//
//  ViewController.swift
//  MemeMe 1.0
//
//  Created by Kseniia Kladovshchikova on 03/01/2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    
    func styleText(_ textField: UITextField, _ text: String) {
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor:UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth: -5,
        ]
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = NSTextAlignment.center
        textField.text = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleText(topText, "TOP")
        styleText(bottomText, "BOTTOM")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imagePickerView.image = image
        }
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func pickAnImageFromLibrary(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
}

