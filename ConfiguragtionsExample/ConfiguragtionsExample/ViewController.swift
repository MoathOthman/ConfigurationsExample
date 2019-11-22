//
//  ViewController.swift
//  ConfiguragtionsExample
//
//  Created by Moath_Othman on 11/22/19.
//  Copyright © 2019 whitetorch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let colorName: String = AppConfigurations().get(key: AppConfigurationsKey.colorName)
        let color = UIColor.init(named: colorName)
        self.view.backgroundColor = color
        
    }


}

