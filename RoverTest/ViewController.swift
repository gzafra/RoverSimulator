//
//  ViewController.swift
//  RoverTestTest
//
//  Created by Guillermo Zafra on 29/03/2017.
//  Copyright © 2017 Guillermo Zafra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    let roversManager = RoversManager(withSize: (5,5))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orders: [Command] = [.forward, .right, .forward]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func runSimulationButtonTapped(_ sender: Any) {
        
    }

}

