//
//  DatePickerController.swift
//  PickerExample
//
//  Created by Mae Yee on 2015-02-15.
//  Copyright (c) 2015 Mae Yee. All rights reserved.
//

import UIKit

class DatePickerController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateButton: UIButton!

    var dateFormatter = NSDateFormatter()
    var dayFormatter = NSDateFormatter()
    
    // data that will be passed along to the next view controller
    var date:String!
    var dayOfWeek: String!
    var isOrWas: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = "< not selected >"
        
        if let navController = self.navigationController {
            navController.navigationBarHidden = true
            navController.popToRootViewControllerAnimated(false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func dateSelected(sender: UIDatePicker) {
        
        // get today's date
        var today = NSDate()
        
        // compare today's date to date selected using the date picker
        var dateComparisonResult: NSComparisonResult = today.compare(datePicker.date)
        
        // set the correct verb tense for the string to be displayed on the output view
        if (dateComparisonResult == NSComparisonResult.OrderedAscending) {
            isOrWas = "is a "
        } else {
            isOrWas = "was a "
        }
        
        // set the date and day formats
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dayFormatter.dateFormat = "EEEE"
        date = dateFormatter.stringFromDate( sender.date )
        dayOfWeek = dayFormatter.stringFromDate(sender.date)
        
        // set label
        dateLabel.textColor = UIColor.blackColor()
        dateLabel.text = date
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        
        if (segue.identifier == "toColorPicker") {
            
            var svc = segue!.destinationViewController as ColorPickerController
            
            // data to be passed to the next view controller
            svc.date = dateLabel.text
            svc.dayOfWeek = dayOfWeek
            svc.isOrWas = isOrWas
        }
    }

}

