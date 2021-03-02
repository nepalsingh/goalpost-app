//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Nepal Singh on 3/1/21.
//

import UIKit

class FinishGoalVC: UIViewController {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointTextField: UITextField!

    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type : GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismisDetail()
    }

    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if pointTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointTextField.text!)!
        goal.goalProgress = Int32(0)

        do {
            try managedContext.save()
            print("Successfully Saved data.")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
