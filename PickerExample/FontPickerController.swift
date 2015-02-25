//
//  FontPickerController.swift
//  PickerExample
//
//  Created by Mae Yee on 2015-02-15.
//  Copyright (c) 2015 Mae Yee. All rights reserved.
//

import UIKit

class FontPickerController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var fontPicker: UIPickerView!
    @IBOutlet weak var fontLabel: UILabel!
    @IBOutlet weak var fontButton: UIButton!
    
    // data to populate the picker
    let data =
    [
        ["Arial", "Avenir", "Baskerville", "Georgia", "Helvetica", "Optima", "Palatino", "Papyrus", "Times New Roman", "Trebuchet MS", "Verdana"],
        ["20", "24", "28", "32"]
    ]
    let sizes: [CGFloat] = [20.0, 24.0, 28.0, 32.0]
    
    // data that will be passed along to the next view controller
    var date:String!
    var dayOfWeek: String!
    var isOrWas: String!
    var colour:UIColor!
    var fontName: String!
    var fontSize: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontPicker.dataSource = self
        fontPicker.delegate = self
        fontLabel.text = "< not selected >"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return data[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var row = fontPicker.selectedRowInComponent(1)
        
        // get name of font and font size
        fontName = data[0][fontPicker.selectedRowInComponent(0)]
        fontSize = data[1][row]

        // if row has been selected, change text color of the label from the default gray to black
        fontLabel.textColor = UIColor.blackColor()
        
        // set the font and text to display in the label
        fontLabel.font = UIFont (name: "\(fontName)", size: sizes[row])
        fontLabel.text = "\(fontName) \n \(fontSize) pt."
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
 
        if (segue.identifier == "toOutputView") {
            
            var svc = segue!.destinationViewController as OutputViewController
            
            // data to be passed to the next view controller
            svc.date = date
            svc.colour = colour
            svc.font = fontLabel.font
            svc.dayOfWeek = dayOfWeek
            svc.isOrWas = isOrWas
            svc.fontName = fontName
        }
    }

}
