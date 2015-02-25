//
//  ColorPickerController.swift
//  PickerExample
//
//  Created by Mae Yee on 2015-02-15.
//  Copyright (c) 2015 Mae Yee. All rights reserved.
//

import UIKit

class ColorPickerController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorButton: UIButton!
    
    // data to populate the picker
    let sizeData = ["Black", "Magenta", "Purple", "Blue", "Cyan", "Green", "Orange", "Red"]
    let pickerColour = [UIColor.blackColor(), UIColor.magentaColor(), UIColor.purpleColor(), UIColor.blueColor(), UIColor.cyanColor(), UIColor.greenColor(), UIColor.orangeColor(), UIColor.redColor()]
    
    // data that will be passed along to the next view controller
    var date:String!
    var dayOfWeek: String!
    var isOrWas: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.dataSource = self
        colorPicker.delegate = self
        colorLabel.text = "< not selected >"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizeData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return sizeData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorLabel.text = sizeData[row]
        colorLabel.textColor = pickerColour[row]
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
 
        if (segue.identifier == "toFontPicker") {
            
            var svc = segue!.destinationViewController as FontPickerController
            
            // data to be passed to the next view controller
            svc.date = date
            svc.colour = colorLabel.textColor
            svc.dayOfWeek = dayOfWeek
            svc.isOrWas = isOrWas
        }
    }
    

    



}
