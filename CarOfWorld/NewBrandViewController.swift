//
//  NewBrandViewController.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 12.11.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import UIKit



class NewBrandViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public var presenter: NewBrandViewDelegate?
    
    private var yearOfIssue = 0
    private var name = ""
    
    @IBOutlet weak var nameTextField: UITextField!{
        didSet{
            nameTextField.delegate = self
        }
    }
    
    @IBOutlet weak var yearOfIssueTextField: UITextField!{
        didSet{
            yearOfIssueTextField.delegate = self
        }
    }
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (presenter as! NewBrandPresenter).view = self

        // Do any additional setup after loading the view.
    }

    
    @IBAction private func addButton(_ sender: Any) {
        
        if let pngData = UIImagePNGRepresentation(logoImageView.image!){
            //NSData *pngData = UIImageJPEGRepresentation(myUIImage,0.5); //alternative comressed jpg instead of png
            let filePath = "\(getDocumentsDirectory())/\(name)-logo.png" //Add the file name
            do{
                print("file path = \(filePath)")
                try pngData.write(to:URL(fileURLWithPath:filePath)) //Write the file
            }
            catch{
                print("Cannot write logo image \(filePath)")
                print("\(error.localizedDescription)")
            }
            presenter?.addBrandWithName(name: name, andYear: yearOfIssue)
        }
        else {
            print("Cannot get image data")
        }
    
    }
    
    func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    
    @IBAction func selectLogoImage(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated:true)
    }
    
    // MARK: UIImagePickerControllerDelegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            logoImageView.contentMode = .scaleAspectFit
            logoImageView.image = pickedImage
            
            
        }
        
        dismiss(animated: true, completion: nil)
    
    }
    //
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        if textField == yearOfIssueTextField {
            if let year = Int(textField.text!){
                textField.resignFirstResponder()
                yearOfIssue = year
                return true
            } else{
                return false
            }

        }
        else if textField == nameTextField{
            name = textField.text!
            textField.resignFirstResponder()
        }
        
        return true
    }

    deinit{
        print("NewBrand view good bay!")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
