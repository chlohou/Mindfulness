//
//  MindfulnessViewController.swift
//  Mindfulness
//
//  Created by Chloe Houlihan on 11/15/17.
//  Copyright © 2017 Chloe Houlihan. All rights reserved.
//

import UIKit

class MindfulnessViewController: UIViewController {

    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var stressSlider: UISlider! {
    didSet{
        stressSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
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
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
