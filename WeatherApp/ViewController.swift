//
//  ViewController.swift
//  WeatherApp
//
//  Created by zlargon on 2014/8/16.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mCity: UILabel!
    @IBOutlet weak var mIcon: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.mCity.text = "Taipei"
        self.mIcon.image = UIImage(named: "sun-icon.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
