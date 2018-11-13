//
//  FieldSurveyDetailViewController.swift
//  FieldSurvey
//
//  Created by Allison Dolan on 11/12/18.
//  Copyright © 2018 Allison Dolan. All rights reserved.
//

import UIKit

class FieldSurveyDetailViewController: UIViewController {
    
    
    @IBOutlet weak var classificationImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    let dateFormatter = DateFormatter()
    
    var fieldSurvey: FieldSurvey?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        if let fieldSurvey = fieldSurvey {
            titleLabel.text = fieldSurvey.title
            dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            classificationImageView.image = UIImage(named: fieldSurvey.classification.rawValue)
            descriptionTextView.text = fieldSurvey.description
        }
        // Do any additional setup after loading the view.
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
