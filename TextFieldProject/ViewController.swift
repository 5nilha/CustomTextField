//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Fabio Quintanilha on 4/17/20.
//  Copyright © 2020 TaskHackers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: CustomLabel!
    @IBOutlet weak var textField: CustomInputTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.setType(type: .currency(.EUR(.fr)))
        self.label.text = "89.87663"
    }


}

