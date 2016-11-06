//
//  CarTableViewController.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 06.11.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import UIKit

class CarTableViewController: UITableViewController {

    public var presenter: CarViewDelegate?
    
    @IBOutlet weak var imageModel: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var yearOfIssue: UILabel!
    @IBOutlet weak var engineTyp: UILabel!
    
    @IBOutlet weak var enginePower: UILabel!
    
    @IBOutlet weak var drive: UILabel!
    
    @IBOutlet var colorViews: [UIView]!

    @IBOutlet weak var transmission: UILabel!
    
    @IBOutlet weak var modelDescription: UITextView!
    
    override func viewDidLoad() {
        
        print("Car viewDidLoad")

        super.viewDidLoad()
        imageModel.image = presenter?.getImage()
        brandName.text = presenter?.getBrandName()
        yearOfIssue.text = "\((presenter?.getYearOfIssue())!)"
        engineTyp.text = presenter?.getEngineTyp()
        transmission.text = presenter?.getTransmission()
        drive.text = presenter?.getDrive()
        enginePower.text = "\((presenter?.getEnginePower())!) л. с."
        modelDescription.text = presenter?.getDescription()
        
        title = presenter?.getName()
        
        
        
        for (index, colorView) in colorViews.enumerated(){
            colorView.backgroundColor = presenter?.getColorForIndex(index: index)
            
        }
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    

        // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 3
        }
        else {
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Colors cell", for: indexPath)

        // Configure the cell...

        return cell
    }*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
