//
//  ViewController.swift
//  FirstApp
//
//  Created by Zeshan Anwar on 2016-02-15.
//  Copyright © 2016 Zeshan Anwar. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet var plus: UIButton!
    @IBOutlet var reset: UIButton!
    @IBOutlet var minus: UIButton!
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
        
        let image : UIImageView = UIImageView(image: UIImage(named: "masjid"))
        image.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.view.addSubview(image)
        self.view.bringSubviewToFront(plus)
        self.view.bringSubviewToFront(reset)
        self.view.bringSubviewToFront(minus)
        self.view.bringSubviewToFront(label)
        minus.backgroundColor = UIColor.greenColor()
        plus.backgroundColor = UIColor.greenColor()
        label.backgroundColor = UIColor.redColor()
        plus.layer.cornerRadius = plus.frame.size.width/2
        plus.clipsToBounds = true
        
        label.alpha = 0.6
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func minusButton(sender: AnyObject) {
        var num: Int = Int(label.text!)!
        num = num > 0 ? num-1 : num
        label.text = String(num)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func plusButton(sender: AnyObject) {
        var num: Int = Int(label.text!)!
        num++
        label.text = String(num)
        if num % 33 == 0 {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }

    @IBAction func resetButton(sender: AnyObject) {
        label.text = "0"
    }
}

