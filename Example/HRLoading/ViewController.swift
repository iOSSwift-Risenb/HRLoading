//
//  ViewController.swift
//  HRLoading
//
//  Created by obgniyum on 01/22/2018.
//  Copyright (c) 2018 obgniyum. All rights reserved.
//

import UIKit
import HRLoading

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        self.startHRMaskLoading()
//        self.startHRLoading()
        
//        HRLoading.startHRLoading()
        HRLoading.startHRMaskLoading()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func xxx(_ sender: Any) {
        print("xxxx")
    }
}

