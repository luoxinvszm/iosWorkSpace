//
//  MapViewController.swift
//  FoodPin
//
//  Created by King Luo on 4/12/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let geoCoder = CLGeocoder()//经纬度解析（根据地址解析为经纬度）
        geoCoder.geocodeAddressString(restaurant.location){ (placemarks,error) -> Void in
            if error != nil {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
            
        }
    }
    
    //自定义地图图标
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let id = "我的图钉"
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotionView = self.mapView.dequeueReusableAnnotationViewWithIdentifier(id) as? MKPinAnnotationView
        
        if(annotionView == nil){
            annotionView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            annotionView!.canShowCallout = true
        }
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        imageView.image = UIImage(named: restaurant.image)
        
        annotionView!.leftCalloutAccessoryView = imageView
        annotionView?.pinTintColor = UIColor.greenColor()
        
        return annotionView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
