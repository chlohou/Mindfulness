//
//  MenuTVC.swift
//  Mindfulness
//
//  Created by ABA Lab on 11/20/17.
//  Copyright © 2017 Chloe Houlihan. All rights reserved.
//

import UIKit

class MenuTVC: UITableViewController {
    
    let highOptions = [MindfulAct(name: "Silly Walking", prompt: "Do a silly walk of some kind. For example, walk backwards, skip, or hop on one foot. What what happens to your state of mind or mood as you walk in a silly way."), MindfulAct(name: "Body Awareness", prompt: "Become aware of your toes and how they feel on the ground. Bring awareness up to your legs. Move the awareness to your chest and your breathing. Move the awareness to your arms and then down to your fingers. Last, bring awareness to your head and clear your thoughts."), MindfulAct(name: "Appreciation",  prompt: "Stop and consciously identify what you are able to appreciate in this moment. It could be something about yourself, another person, your enviornment, or what your body is sensing."), MindfulAct(name: "Look Up!", prompt: "Throughout your day, deliberately look up. Take a few minutes to really look at the ceiling in the room, tall buildings, the tops of tress, and the sky.")]
    let midOptions = [MindfulAct(name: "Three Breaths", prompt: "Take three breaths. During these breaths, silence your mind. It's like turning off the inner radio or TV for a few minutes. Then open all your senses and just be aware - of color, sound, touch, and smell."), MindfulAct(name: "On and Off", prompt: "Sit or stand in a comfortable position. Take a deep breath in and make every muscle in your body tense - your toes, legs, fingers, arms, and face. Take a deep breath out and relax your body, turning all the energy off."), MindfulAct(name: "Stare at the Center", prompt: "Focus on the spinning circle in the center of the screen. Empty all other thoughts and focus."), MindfulAct(name: "Observe your thoughts", prompt: "Relax and think about whatever comes to your mind. Understand that you want to think about this and accept it. Consider what your thoughts are and where they are coming from. Take your time, breathe, relax and take as long as you need to make peace with your thoughts.")]
    let lowOptions = [MindfulAct(name: "Mindful Walking", prompt: "Go for a walk. Notice all the body movements, sounds, patterns, and thoughts envolved while walking."), MindfulAct(name: "Soles of the Feet", prompt: "Place awareness in the soles of your feet. Become aware of the sensations on the bottoms of the feet, such as the pressure of the floor or ground beneath the feet, or the warmth or coolness of the feet. Do this whenever you begin to notice yourself becoming anxious or upset."), MindfulAct(name: "Release Anxiety", prompt: "Become aware of anxiety. Notice all the body sensations, emotions, and thoughts associated with anxiety. Notice when axiety makes an appearance in your day. Pause briefly to assess whether anxiety is present within you. You may also notice what makes anxiety worse, and what relieves it."), MindfulAct(name: "Notice Dislike", prompt: "Become aware of negative feelings you may have towards someone or something. Try to think about what happened just before these negatives feelings occured. What sense impressions occured - sight, sound, touch, taste, smell, or thought?" )]
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
