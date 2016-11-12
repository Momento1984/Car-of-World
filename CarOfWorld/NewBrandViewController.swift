//
//  NewBrandViewController.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 12.11.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import UIKit



class NewBrandViewController: UIViewController, UITextFieldDelegate {

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

        // Do any additional setup after loading the view.
    }

    
    @IBAction private func addButton(_ sender: Any) {
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        if textField == yearOfIssueTextField {
            if let year = Int(textField.text!){
                textField.resignFirstResponder()
                return true
            } else{
                return false
            }

        }
        //searchText = textField.text
        textField.resignFirstResponder()
        return true
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
