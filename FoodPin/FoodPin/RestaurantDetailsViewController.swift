//
//  RestaurantDetailsViewController.swift
//  FoodPin
//
//  Created by King Luo on 3/25/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var rName: UILabel!
    @IBOutlet weak var rLocation: UILabel!
    @IBOutlet weak var rType: UILabel!
    @IBOutlet weak var bookButton: UIButton!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        restaurantImageView.image = UIImage(data: restaurant.image!)
        rName.text = restaurant.name
        rLocation.text = restaurant.location
        rType.text = restaurant.type
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
