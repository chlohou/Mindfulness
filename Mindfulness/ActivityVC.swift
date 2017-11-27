//
//  ActivityVC.swift
//  Mindfulness
//
//  Created by ABA Lab on 11/20/17.
//  Copyright © 2017 Chloe Houlihan. All rights reserved.
//

import UIKit

class ActivityVC: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var isFave = Bool()
    var mindActivity = String()
    var mindPrompt = String()
    
    @IBOutlet weak var display: UIScrollView!
    @IBOutlet weak var mindfulName: UILabel!
    @IBOutlet weak var centerStare: UIActivityIndicatorView!
    @IBOutlet weak var mindfulPrompt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mindfulName.text = mindActivity
        mindfulPrompt.text = mindPrompt
        if mindActivity == "Stare at the Center"{
            centerStare.startAnimating()
            centerStare.color = .black
            
        
        }
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
        
        if isFave == false {
        let favButton = UIBarButtonItem(title: "Add to Favorites", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.fave(sender:)))
        self.navigationItem.rightBarButtonItem = favButton
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        
    _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func fave(sender: UIBarButtonItem) {
        
        let fave = Activity(context: context)
        fave.mindName = mindActivity
        fave.mindPrompt = mindPrompt
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    _ = navigationController?.popViewController(animated: true)
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


