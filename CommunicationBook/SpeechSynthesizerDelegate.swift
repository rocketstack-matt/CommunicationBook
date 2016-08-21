//
//  SpeechSynthesizerDelegate.swift
//  CommunicationBook
//
//  Created by Matthew Bain on 21/08/2016.
//  Copyright © 2016 Codeghost Ltd. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class SpeechSynthesizerDelegate: NSObject, AVSpeechSynthesizerDelegate {
    private let buttons: [UIButton]

    init(buttons: [UIButton]) {
        self.buttons = buttons
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didStartSpeechUtterance utterance: AVSpeechUtterance) {
        changeButtonState()
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        changeButtonState()
    }
    
    private func changeButtonState() {
        buttons.forEach { (button) -> () in
            button.userInteractionEnabled = !button.userInteractionEnabled
        }
    }
}