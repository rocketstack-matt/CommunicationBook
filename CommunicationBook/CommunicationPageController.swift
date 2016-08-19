//
//  CommunicationPageController.swift
//  CommunicationBook
//
//  Created by Matthew Bain on 19/08/2016.
//  Copyright © 2016 Codeghost Ltd. All rights reserved.
//

import UIKit
import AVFoundation

class CommunicationPageController: UIViewController {

    private let MAX_VIEW = 1
    private let synth = AVSpeechSynthesizer()
    
    private var lastIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func touchButtonDown(sender: UIButton) {
        let utterance = AVSpeechUtterance(string: sender.accessibilityLabel!)
        synth.speakUtterance(utterance)
    }
    
    @IBAction func swipeDown(sender: AnyObject) {
        lastIndex = Int(self.restorationIdentifier!)!
        if(self.restorationIdentifier=="0" && lastIndex != 0) {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(lastIndex))
            self.presentViewController(vc!, animated: true, completion: nil)
        } else {
            var index = lastIndex + 1
            if(index>=MAX_VIEW+1)
            {
                index = 1;
            }
            
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(index))
            self.presentViewController(vc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func swipeUp(sender: AnyObject) {
        lastIndex = Int(self.restorationIdentifier!)!
        if(self.restorationIdentifier=="0" && lastIndex != 0) {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(lastIndex))
            self.presentViewController(vc!, animated: true, completion: nil)
        } else {
            var index = lastIndex - 1
            if(index<=0)
            {
                index = MAX_VIEW;
            }
            
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(index))
            self.presentViewController(vc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func swipeRightLeft(sender: AnyObject) {
        lastIndex = Int(self.restorationIdentifier!)!
        if(self.restorationIdentifier=="0" && lastIndex != 0) {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(lastIndex))
            self.presentViewController(vc!, animated: true, completion: nil)
        } else {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("0")
            self.presentViewController(vc!, animated: true, completion: nil)
        }
    }
}
