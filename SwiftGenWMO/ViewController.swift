//
//  ViewController.swift
//  SwiftGenWMO
//
//  Created by Ben Chatelain on 11/9/15.
//  Copyright © 2015 Ben Chatelain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var exampleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        exampleLabel.textColor = UIColor(named: .TextColor)
    }

}

