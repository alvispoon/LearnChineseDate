//
//  ViewController.swift
//  LearnChineseEveryday
//
//  Created by Alvis Poon on 23/4/2020.
//  Copyright © 2020 Alvis Poon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{


    @IBOutlet weak var speakerImage: UIImageView!

    var currentWord = 0
    var sentence = ""
    var speaking : Bool = false
    
    
    @IBOutlet weak var SVMain: UIStackView!
    @IBOutlet var LblText: [UILabel]!
    
    var lblAllText: [UILabel]! = [UILabel]()
    
    
    let synthesizer = AVSpeechSynthesizer()
    
    
    override func viewDidLoad() {
        
        
        synthesizer.delegate = self
        
        super.viewDidLoad()
        getToday()
        // Do any additional setup after loading the view.
        
        let yearStr = getChineseYear()
        let monthStr = getChineseMonth()
        let dayStr = getChineseDate()
        sentence = "今天是\(yearStr)年\(monthStr)月\(dayStr)日"
        //sentence = "今天是"
        print (sentence)
        
        for j in 0...LblText.count-1{
            LblText[j].isHidden = true
        }
        
        for i in 0...sentence.count-1{
            let lbl1 = UILabel()
            SVMain.addArrangedSubview(lbl1)
            lbl1.text = String(sentence[sentence.index(sentence.startIndex, offsetBy: i)..<sentence.index(sentence.startIndex, offsetBy: i+1)])
            lbl1.myLabel()
            lblAllText.append(lbl1)
        }
        
         speakNow(currentWord: currentWord)
       
         speakerImage.isUserInteractionEnabled = true
         // Create and add the Gesture Recognizer
        let speakgesture = UITapGestureRecognizer(target: self, action: #selector(speakDate))
         speakerImage.addGestureRecognizer(speakgesture)

    }
    
    
    
    @objc func speakDate(_ sender: Any) {
             print ("a")
        speakNow(currentWord: currentWord)
          // speakNow(Intro: "今天是", Year: getYear(), Month: getMonth(), Day: getDate())
       }
//
//
//    func getNumber(fromText text: String) -> NSNumber? {
//        let locale = Locale(identifier: "zh_Hans_CN")
//        let numberFormatter = NumberFormatter()
//        numberFormatter.locale = locale
//        numberFormatter.numberStyle = .spellOut
//        guard let number = numberFormatter.number(from: text) else { return nil }
//        print(number)
//        return number
//    }

    
    func speak(say: String) {
        
        let utterance = AVSpeechUtterance(string: say)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
        utterance.rate = 0.2
        utterance.pitchMultiplier = 0.5
        utterance.preUtteranceDelay = 0
        utterance.volume = 1
        synthesizer.speak(utterance)
    }
    
    func speakNow(currentWord: Int){
        speaking = true
        lblAllText[currentWord].textColor = .blue
        speak(say: String(sentence[sentence.index(sentence.startIndex, offsetBy: currentWord)..<sentence.index(sentence.startIndex, offsetBy: currentWord+1)]))
    }
    
    func speakAll(say: String, charLbl: [UILabel]){
        //
        for i in 0...say.count-1{
            speak(say: String(say[say.index(say.startIndex, offsetBy: i)..<say.index(say.startIndex, offsetBy: i+1)]))
        }
    }

}

extension ViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        //Speaking is done, enable speech UI for next round
        print ("COMPLETED")
        currentWord += 1
        if (currentWord<sentence.count){
            speakNow(currentWord: currentWord)
        }
        else{
            currentWord = 0
            speaking = false
            for i in 0...lblAllText.count-1{
                lblAllText[i].textColor = .black
            }
        }
    }
}

extension UILabel {
    func myLabel() {
        font = .boldSystemFont(ofSize: 30)
        adjustsFontSizeToFitWidth = true
        textAlignment = .center
        textColor = .black
        numberOfLines = 0
        lineBreakMode = .byCharWrapping
        minimumScaleFactor = 0.2
    }
}
