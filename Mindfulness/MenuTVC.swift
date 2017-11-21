//
//  MenuTVC.swift
//  Mindfulness
//
//  Created by ABA Lab on 11/20/17.
//  Copyright © 2017 Chloe Houlihan. All rights reserved.
//

import UIKit

class MenuTVC: UITableViewController {
    
    let highOptions = [MindfulAct(name: "Mindful Walking", prompt: "do something"), MindfulAct(name: "Soles of the Feet", prompt: "do something"), MindfulAct(name: "Release Anger", prompt: "do something")]
    let midOptions = [MindfulAct(name: "Mindful Breathing", prompt: " "), MindfulAct(name: "On and Off", prompt: " "), MindfulAct(name: "Stare at the Center", prompt: " "), MindfulAct(name: "Observe your thoughts", prompt: " ")]
    let lowOptions = [MindfulAct(name: "Five Senses", prompt: " "), MindfulAct(name: "Body Awareness", prompt: " ")]
    var options : [MindfulAct]?
    var selectedRow = Int()
    var stressLevel = Int()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if stressLevel >= 1 && stressLevel <= 3 {
            options = lowOptions
        } else if stressLevel < 7 {
            options = midOptions
        } else {
            options = highOptions
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        
        cell.textLabel?.text = options![indexPath.row].name

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: react to user selecting row
        //I want the detail view controller to update based on the row that I selected
        
        //TODO: get cell information
        
        selectedRow = indexPath.row
        //call segue manually
        performSegue(withIdentifier: "cellSelected", sender: self)
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destVC = segue.destination as! ActivityVC
        destVC.isFave = false
        destVC.mindPrompt = options![selectedRow].prompt
        destVC.mindActivity = options![selectedRow].name
        
    }
    

}
