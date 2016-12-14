//
//  ViewController2.swift
//  CalcApp
//
//  Created by 宮澤賢生 on 2016/12/13.
//  Copyright © 2016年 宮澤賢生. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var param:String = "0"

    @IBOutlet weak var result_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
         self.result_label.text = self.param
    }

    
}
