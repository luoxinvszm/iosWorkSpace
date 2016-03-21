//
//  ViewControllerExtension.swift
//  BeautyGallery
//
//  Created by King Luo on 11/24/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import UIKit

//使用 PickerView 需要实现 UIPickerViewDataSource 和 UIPickerViewDelegate 协议
extension ViewController : UIPickerViewDataSource {
    //实现 UIPickerViewDataSource 必须重写以下两个方法
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        //该方法确定 PickerView 的列数，如 DatePicker 有三列，则 return 3
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //确定 PickerView 每列的项数
        return beauties.count
    }
}

extension ViewController : UIPickerViewDelegate {
    //实现 UIPickerViewDelegate 需要重写下列方法才能给每项初始化值
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return beauties[row]
    }
}