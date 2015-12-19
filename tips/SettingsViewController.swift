
//
//  SettingsViewController.swift
//  tips
//
//  Created by Suyeon Kang on 12/19/15.
//  Copyright © 2015 Suyeon Kang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstP: UITextField!
    @IBOutlet weak var secondP: UITextField!
    @IBOutlet weak var thirdP: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        //  let tipValue = defaults.doubleForKey("default_tip_percentage")
        let first=defaults.integerForKey("first")
        let second=defaults.integerForKey("second")
        let third=defaults.integerForKey("third")
        firstP.text=String(first);
        secondP.text=String(second);
        thirdP.text=String(third);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveClick(sender: AnyObject) {
         let defaults = NSUserDefaults.standardUserDefaults()
        let first=Int(firstP.text!)
        let second=Int(secondP.text!)
        let third=Int(thirdP.text!)
        defaults.setInteger(first!,forKey:"first")
        defaults.setInteger(second!,forKey:"second")
        defaults.setInteger(third!,forKey:"third")
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
