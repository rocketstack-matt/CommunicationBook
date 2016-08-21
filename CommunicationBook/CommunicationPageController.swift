//
//  CommunicationPageController.swift
//  CommunicationBook
//
//  Created by Matthew Bain on 19/08/2016.
//  Copyright © 2016 Codeghost Ltd. All rights reserved.
//

import UIKit
import AVFoundation

// Global variable to track previous page for navigation
private var lastIndex = 0

class CommunicationPageController: UIViewController, AVSpeechSynthesizerDelegate {

    private let MAX_VIEW = 27
    private let synth = AVSpeechSynthesizer()

    @IBOutlet var grSwipeRight: UISwipeGestureRecognizer!
    @IBOutlet var grSwipeLeft: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        synth.delegate = self
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
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        changeButtonAndGestureRecognizerState()
    }
    
    private func changeButtonAndGestureRecognizerState() {
        // Update button state during/after speaking
        view.subviews.forEach { (subview) -> () in
            if let button = subview as? UIButton {
                button.userInteractionEnabled = !button.userInteractionEnabled
            }
        }
        
        // Update gesture recognizer state during/after speaking
        view.gestureRecognizers?.forEach({ (gr) -> () in
            gr.enabled = !gr.enabled
        })
    }
    
    @IBAction func touchButtonDown(sender: UIButton) {
        changeButtonAndGestureRecognizerState()
        let utterance = AVSpeechUtterance(string: sender.accessibilityLabel!)
        synth.speakUtterance(utterance)
    }
    
    @IBAction func swipeUp(sender: AnyObject) {
        if(self.restorationIdentifier=="0" && lastIndex != 0) {
            let index = lastIndex
            lastIndex = 0
            transitionViewController(index, direction: kCATransitionFromTop)
        } else if(self.restorationIdentifier=="0" && lastIndex == 0) {
            let index = 1
            lastIndex = 0
            transitionViewController(index, direction: kCATransitionFromTop)
        } else {
            lastIndex = Int(self.restorationIdentifier!)!
            var index = lastIndex+1
            if(index>=MAX_VIEW+1)
            {
                index = 1;
            }
            
            transitionViewController(index, direction: kCATransitionFromTop)
        }
    }
    
    @IBAction func swipeDown(sender: AnyObject) {
        if(self.restorationIdentifier=="0" && lastIndex != 0) {
            let index = lastIndex
            lastIndex = 0
            transitionViewController(index, direction: kCATransitionFromBottom)
        } else if(self.restorationIdentifier=="0" && lastIndex == 0) {
            let index = MAX_VIEW
            lastIndex = 0
            transitionViewController(index, direction: kCATransitionFromBottom)
        } else {
            lastIndex = Int(self.restorationIdentifier!)!
            var index = lastIndex-1
            if(index<=0)
            {
                index = MAX_VIEW;
            }
            transitionViewController(index, direction: kCATransitionFromBottom)
        }
    }
    
    @IBAction func swipeRightLeft(sender: UIGestureRecognizer) {
        if(self.restorationIdentifier=="0" && lastIndex != 0) {
            let index = lastIndex
            lastIndex = 0
            if(sender==self.grSwipeLeft) {
                transitionViewController(index, direction: kCATransitionFromRight)
            } else {
                transitionViewController(index, direction: kCATransitionFromLeft)
            }
        } else if(self.restorationIdentifier=="0" && lastIndex == 0) {
            let index = 1
            lastIndex = 0
            if(sender==self.grSwipeLeft) {
                transitionViewController(index, direction: kCATransitionFromRight)
            } else {
                transitionViewController(index, direction: kCATransitionFromLeft)
            }
        } else {
            let index = 0
            lastIndex = Int(self.restorationIdentifier!)!
            if(sender==self.grSwipeLeft) {
                transitionViewController(index, direction: kCATransitionFromRight)
            } else {
                transitionViewController(index, direction: kCATransitionFromLeft)
            }
        }
    }
    
    private func transitionViewController(index: Int, direction: String) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier(String(index))
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = direction
        self.view.window!.layer.addAnimation(transition, forKey: kCATransition)
        self.presentViewController(vc!, animated: false, completion: nil)
    }

}
