//
//  ViewController.swift
//  Weather
//
//  Created by King Luo on 11/24/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var temperature: UILabel!
    
    @IBOutlet weak var loadingIndiacator: UIActivityIndicatorView!
    
    @IBOutlet weak var loading: UILabel!
    
    
    let locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        //初始化精确度,设置为最大精确度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //启动loadingIndicate
        self.loadingIndiacator.startAnimating()
        
        //设置背景图
        let background = UIImage(named: "background.png")
        self.view.backgroundColor = UIColor(patternImage: background!)
        
        if(ios8()){
            locationManager.requestAlwaysAuthorization()
        }
        
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //地理位置更新时调用
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //获得最后一个 location 对象
        let location: CLLocation = locations[locations.count-1] as CLLocation
        if(location.horizontalAccuracy > 0) {
            print(location.coordinate.latitude)//打印经度
            print(location.coordinate.longitude)//打印维度
            self.updateWeatherInfo(location.coordinate.latitude, longitude: location.coordinate.longitude)
            locationManager.stopUpdatingLocation()
        }
    }
    
    //获得地理位置出错的时候调用
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
        self.loading.text = "地理位置信息可不用！"
    }
    
    func updateWeatherInfo(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let manager = AFHTTPRequestOperationManager()//AFNetworking HTTP Request 管理器
        let url = "http://api.openweathermap.org/data/2.5/weather"//免费天气服务url
        
        let params = ["lat" : latitude, "lon" : longitude, "cnt" : 0]
        
        manager.GET(url,
            parameters: params,
            success: { (operation:
                AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                print("JSON: " + responseObject.description!)
                self.updateUISuccess(responseObject as! NSDictionary)
            },
            failure: { (operation:
                AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                print("Error: " + responseObject.description!)
            })
        
    }
    
    func updateUISuccess (jsonResult: NSDictionary!) {
        //停止 loadingIndicate
        self.loadingIndiacator.stopAnimating()
        //设置 loadingIndicate 为隐藏
        self.loadingIndiacator.hidden = true
        //隐藏loading
        self.loading.text = nil
        //获取温度
        if let tempResult = jsonResult["main"]?["temp"]? as? Double {
            var temperature: Double
            if jsonResult["sys"]?["country"]? as! String == "US" {
                // Convert temperature to Fahrenheit if user is within the US
                temperature = round(((tempResult - 273.15) * 1.8) + 32)
            } else {
                // otherwise, convert temperature to Celsius
                temperature = round(tempResult - 273.15)
            }
            
            self.temperature.text = "\(temperature)°"
            //设置空间字体，字号
            self.temperature.font = UIFont.boldSystemFontOfSize(60)
            
            //设置城市名称
            var name = jsonResult["name"]? as! String
            self.location.text = "\(name)"
            self.location.font = UIFont.boldSystemFontOfSize(25)
            
            //获取天气信息
            var condition = (jsonResult["weather"]? as! NSArray)[0]["id"]? as! Int
            //获取日出日落信息
            var sunrise = jsonResult["sys"]?["sunrise"]? as! Double
            var sunset = jsonResult["sys"]?["sunset"]? as! Double
            
            var nightTime = false//是否为夜晚标记
            var now = NSDate().timeIntervalSince1970//获取当前时间毫秒数
            if now < sunrise || now > sunset {
                nightTime = true
            }
            
            self.updateWeatherIcon(condition, nightTime: nightTime)

        } else {
            self.loading.text = "天气信息不可用！"
        }
    }
    
    func updateWeatherIcon (condition: Int, nightTime: Bool) {
        //http://bugs.openweathermap.org/projects/api/wiki/Weather_Condition_Codes
        //开源天气服务器天气状况代码
        if condition < 300 {
            if nightTime {
                self.icon.image = UIImage(named: "tstorm1_night")
            } else {
                self.icon.image = UIImage(named: "tstorm1")
            }
        }
        // Drizzle
        else if condition < 500 {
            self.icon.image = UIImage(named: "light_rain")
            
        }
        // Rain / Freezing rain / Shower rain
        else if condition < 600 {
            self.icon.image = UIImage(named: "shower3")
        }
        // Snow
        else if condition < 700 {
            self.icon.image = UIImage(named: "snow4")
        }
        // Fog / Mist / Haze / etc.
        else if condition < 771 {
            if nightTime {
                self.icon.image = UIImage(named: "fog_night")
            } else {
                self.icon.image = UIImage(named: "fog")
            }
        }
        // Tornado / Squalls
        else if condition < 800 {
            self.icon.image = UIImage(named: "tstorm3")
        }
        // Sky is clear
        else if condition == 800 {
            if (nightTime){
                self.icon.image = UIImage(named: "sunny_night")
            }
            else {
                self.icon.image = UIImage(named: "sunny")
            }
        }
        // few / scattered / broken clouds
        else if condition < 804 {
            if (nightTime){
                self.icon.image = UIImage(named: "cloudy2_night")
            }
            else{
                self.icon.image = UIImage(named: "cloudy2")
            }
        }
        // overcast clouds
        else if (condition == 804) {
            self.icon.image = UIImage(named: "overcast")
        }
        // Extreme
        else if ((condition >= 900 && condition < 903) || (condition > 904 && condition < 1000)) {
            self.icon.image = UIImage(named: "tstorm3")
        }
        // Cold
        else if (condition == 903) {
            self.icon.image = UIImage(named: "snow5")
        }
            // Hot
        else if (condition == 904) {
            self.icon.image = UIImage(named: "sunny")
        }
            // Weather condition is not available
        else {
            self.icon.image = UIImage(named: "dunno")
        }
    }

    func ios8() -> Bool {
        //获得当前设备的ios版本号
        let version: NSString = UIDevice.currentDevice().systemVersion
        print(version.substringToIndex(1))//版本号为8.*
        return version.substringToIndex(1) == "8"
    }
    
    
}

