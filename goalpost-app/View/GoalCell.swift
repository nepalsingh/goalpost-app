//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Nepal Singh on 2/28/21.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalProgressLbl: UILabel!
    
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    
    func configureCell(description: String, type: GoalType, goalProgressAmount: Int) {
        self.goalTypeLbl.text = type.rawValue
        self.goalDescriptionLbl.text = description
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
        
    }
    
}
