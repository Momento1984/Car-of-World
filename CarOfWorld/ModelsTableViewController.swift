//
//  ModelsTableViewController.swift
//  CarOfWorld
//
//  Created by Виталий Антипов on 31.10.16.
//  Copyright © 2016 Виталий Антипов. All rights reserved.
//

import UIKit

class ModelsTableViewController: UITableViewController {
    
    public var presenter: ModelViewDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Model viewDidLoad")
        title = presenter?.getName()
        
        (presenter as! ModelPresenter).view = self
                //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "modelCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CarRouter.shared.viewDidAppearWithPresenter(presenter: presenter!)

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if presenter != nil{
            return presenter!.getCountList()
        }
        else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "modelCell", for: indexPath)

        cell.textLabel?.text = presenter?.getNameForIndex(index: indexPath.row)
        if let year = presenter?.getYearOfIssueForIndex(index: indexPath.row){
            cell.detailTextLabel?.text = "\(year)"
        }
        cell.imageView?.image = presenter?.getImageForIndex(index: indexPath.row)
        return cell
        

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.selectItemForIndex(index: indexPath.row)
        presenter?.nextViewDetailForIndex(index: indexPath.row)
    }

    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        CarRouter.shared.prepare(for: segue, sender: sender)
    }
    
    
    deinit{
        print("Model view good bay!")
    }

}
