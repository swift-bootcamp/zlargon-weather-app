//
//  ViewController.swift
//  WeatherApp
//
//  Created by zlargon on 2014/8/16.
//  Copyright (c) 2014年 zlargon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDataDelegate {

    @IBOutlet weak var mCity: UILabel!
    @IBOutlet weak var mIcon: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "cloud-icon.jpg"))

        self.mCity.text = "Taipei"
        self.mIcon.image = UIImage(named: "sun-icon.jpg")

        startConnection()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startConnection() {
        var resetAPI: String = "http://api.openweathermap.org/data/2.5/weather?q=Taipei"

        var connection: NSURLConnection = NSURLConnection(
            request: NSURLRequest(
                URL: NSURL(string: resetAPI)
            ),
            delegate: self,
            startImmediately: true
        )

        println("start download")
    }

    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        println("downloading")
    }

    func connectionDidFinishLoading(connection: NSURLConnection!) {
        println("download finish")
    }
}
