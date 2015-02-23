//
//  OutputViewController.swift
//  PickerExample
//
//  Created by Mae Yee on 2015-02-15.
//  Copyright (c) 2015 Mae Yee. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var msgLabel: UILabel!

    // data that was passed in from previous view controllers
    var date: String!
    var colour: UIColor!
    var font: UIFont!
    var dayOfWeek: String!
    var isOrWas: String!
    var fontName: String!
    
    @IBAction func tryAgainButtonPress(sender: AnyObject) {
        self.performSegueWithIdentifier("toDatePicker", sender:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // display notification if no date was selected
        if (date == "< not selected >") {
            outputLabel.text = "You must move \n the picker wheels \n to select actual values. \n Please try again."
            dayOfWeek = ""
        } else {
            // set the output label font, color, and text to display
            outputLabel.font = font
            outputLabel.textColor = colour
            outputLabel.text = "\(date) \(isOrWas) \n \(dayOfWeek)"
        }
        
        // set the message label font style to match the output label
        msgLabel.font = UIFont (name: "\(fontName)", size: 20.0)
        
        // text to display in the message label, depending on which day of the week it is
        switch dayOfWeek {
        case "Monday":
            msgLabel.text = "Monday's child \n is fair of face"
            break
        case "Tuesday":
            msgLabel.text = "Tuesday's child \n is full of grace"
        case "Wednesday":
            msgLabel.text = "Wednesday's child \n is full of woe"
        case "Thursday":
            msgLabel.text = "Thursday's child \n has far to go"
        case "Friday":
            msgLabel.text = "Friday's child \n is loving and giving"
        case "Saturday":
            msgLabel.text = "Saturday's child \n works hard for a living"
        case "Sunday":
            msgLabel.text = "The child who is born \n on the Sabbath day \n Is fair and wise \n and good in every way"
        default:
            msgLabel.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
