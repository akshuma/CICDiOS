//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Akshuma Trivedi on 13/09/20.
//  Copyright © 2020 Akshuma Trivedi. All rights reserved.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics


class ViewController: UIViewController {

    @IBOutlet weak var retirmentAgeTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var monthlyInvestmentTextField: UITextField!
    @IBOutlet weak var savingTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if MSCrashes.hasCrashedInLastSession() {
            let alert = UIAlertController.init(title: "oops", message: "sorry abput crashes.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Its cool", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        MSAnalytics.trackEvent("navigate_to_calculate")
    }

    @IBAction func calculateButton(_ sender: Any) {
       // MSCrashes.generateTestCrash()
        let currentage: Int? = Int(ageTextField.text ?? "")
        let retirmentAge: Int? = Int(retirmentAgeTextField.text ?? "")
        let properties = ["current _age":"\(currentage ?? 0)",
                          "planned_age": "\(retirmentAge ?? 0)"]
        MSAnalytics.trackEvent("calculate_retirment_amount",withProperties: properties)
        
    }
    
}

