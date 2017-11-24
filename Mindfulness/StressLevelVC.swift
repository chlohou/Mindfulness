//
//  StressLevelVC.swift
//  Mindfulness
//
//  Created by Chloe Houlihan on 11/15/17.
//  Copyright © 2017 Chloe Houlihan. All rights reserved.
//

// TO DO: Delete Favorites, Mess with stress screen/display screen, Add the actual prompts

import UIKit


class StressLevelVC: UIViewController {

    
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var stressSlider: UISlider!
    
    @IBOutlet weak var happyFace: CreateFace!
    
    @IBOutlet weak var sadFace: CreateFace!
   
    @IBOutlet weak var submitButton: UIButton! { didSet {
        submitButton.clipsToBounds = true
        submitButton.layer.cornerRadius = submitButton.bounds.size.width/4
        submitButton.layer.backgroundColor = UIColor.black.cgColor
        submitButton.layer.borderWidth = 2
        submitButton.layer.borderColor = UIColor.white.cgColor
        
        
    }
    }
    
    
    @IBAction func stressChange(_ sender: UISlider) {
        sliderValue.text = String(format: "%.0f", stressSlider.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! MenuTVC
        destVC.stressLevel = Int(stressSlider.value)
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

 

}
