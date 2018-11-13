//
//  FieldSurveyViewController.swift
//  FieldSurvey
//
//  Created by Allison Dolan on 11/12/18.
//  Copyright © 2018 Allison Dolan. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    var dateFormatter = DateFormatter()

    @IBOutlet weak var fieldSurveyTableView: UITableView!
    
    let jsonFileName = "field_observations"
    var fieldSurveys: FieldSurveys?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        fieldSurveys = FieldSurveyLoader.load(jsonFileName: jsonFileName)
        
        if fieldSurveys == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurveys?.surveys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fieldSurveyTableView.dequeueReusableCell(withIdentifier: "fieldSurveyCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell, let fieldSurvey = fieldSurveys?.surveys[indexPath.row]{
            cell.titleLabel.text = fieldSurvey.title
            cell.dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
            cell.classificationImageView.image = UIImage(named: fieldSurvey.classification.rawValue)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController, let selectedIndexPath = fieldSurveyTableView.indexPathForSelectedRow{
            destination.fieldSurvey = fieldSurveys?.surveys[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String){
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
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
