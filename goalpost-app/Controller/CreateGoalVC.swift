//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Nepal Singh on 3/1/21.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTextView: UITextField!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") else { return}
            presentDetail(finishGoalVC)
            
        }
    }
    
    @IBAction func shortTermBtnPresses(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismisDetail()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
