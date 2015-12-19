//
//  ViewController.swift
//  tips
//
//  Created by Suyeon Kang on 12/18/15.
//  Copyright © 2015 Suyeon Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        //  let tipValue = defaults.doubleForKey("default_tip_percentage")
        let check=defaults.integerForKey("first")
        if check != 0 {
            print(check)
        }
        else{
            defaults.setInteger(18,forKey:"first")
            defaults.setInteger(20,forKey:"second")
            defaults.setInteger(22,forKey:"third")
            //defaults.synchronize()
        }
        let first=defaults.integerForKey("first").description
        print(defaults.integerForKey("first"))
        let second=defaults.integerForKey("second").description
        let third=defaults.integerForKey("third").description
        tipControl.setTitle(String(format:"%%%@",first), forSegmentAtIndex: 0)
        tipControl.setTitle(String(format:"%%%@",second),forSegmentAtIndex: 1)
        tipControl.setTitle(String(format:"%%%@",third), forSegmentAtIndex: 2)

        
    }
    override func viewDidLoad() {
        let defaults = NSUserDefaults.standardUserDefaults()
      //  let tipValue = defaults.doubleForKey("default_tip_percentage")
        let check=defaults.integerForKey("first")
        if check != 0 {
            print(check)
        }
        else{
            defaults.setInteger(18,forKey:"first")
            defaults.setInteger(20,forKey:"second")
            defaults.setInteger(22,forKey:"third")
            //defaults.synchronize()
        }
        let first=defaults.integerForKey("first").description
        print(defaults.integerForKey("first"))
        let second=defaults.integerForKey("second").description
        let third=defaults.integerForKey("third").description
        tipControl.setTitle(String(format:"%%%@",first), forSegmentAtIndex: 0)
        tipControl.setTitle(String(format:"%%%@",second),forSegmentAtIndex: 1)
        tipControl.setTitle(String(format:"%%%@",third), forSegmentAtIndex: 2)
        
        super.viewDidLoad()
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages=[0.18,0.2,0.22]
        let defaults = NSUserDefaults.standardUserDefaults()

        tipPercentages[0]=Double(defaults.integerForKey("first"))*0.01
        tipPercentages[1]=Double(defaults.integerForKey("second"))*0.01
        tipPercentages[2]=Double(defaults.integerForKey("third"))*0.01
        
        
        
        
        let tipPercentage=tipPercentages[tipControl.selectedSegmentIndex];
        //print("User editing bill")
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip=billAmount*tipPercentage;
        let total=billAmount+tip
        tipLabel.text="$\(tip)"
        totalLabel.text="$\(total)"
        tipLabel.text=String(format:"$%.2f",tip)
        totalLabel.text=String(format:"$%.2f",total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
}

