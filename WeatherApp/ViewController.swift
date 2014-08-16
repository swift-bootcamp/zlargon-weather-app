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

    var data : NSMutableData = NSMutableData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.mCity.text = "Taipei"

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

        self.data.appendData(data)
    }

    func connectionDidFinishLoading(connection: NSURLConnection!) {
        println("download finish")

        var json: NSString = NSString(data: self.data, encoding: NSUTF8StringEncoding)

        // JSON Parse
        var error: NSError?
        let jsonDictionaray = NSJSONSerialization.JSONObjectWithData(
            self.data,
            options: NSJSONReadingOptions.MutableContainers,
            error: &error) as NSDictionary

        println(jsonDictionaray)

        // get temperature
        let temp: AnyObject? = jsonDictionaray["main"]?["temp"]?

        let absolute_zero: Float = 273.15

        // convert to Celsius and Fahrenheit
        let celsiusTemp    = Int(round(temp!.floatValue - absolute_zero))
        let fahrenheitTemp = celsiusTemp * (9/5) + 32

        println("celsius = \(celsiusTemp)")
        println("fahrenheitTemp = \(fahrenheitTemp)")
    }
}
