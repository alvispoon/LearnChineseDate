//
//  util.swift
//  LearnChineseEveryday
//
//  Created by Alvis Poon on 23/4/2020.
//  Copyright © 2020 Alvis Poon. All rights reserved.
//

import Foundation

import AVFoundation

let synthesizer = AVSpeechSynthesizer()


func speak(say: String) {
    let utterance = AVSpeechUtterance(string: say)
    utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
//    utterance.voice = AVSpeechSynthesisVoice(identifier: "Karen")
    utterance.rate = 0.1
    utterance.pitchMultiplier = 0.5
    utterance.preUtteranceDelay = 0
    utterance.volume = 1


    synthesizer.speak(utterance)
}

func speakNow(Intro: String, Year : String, Month : String, Day: String){
    let str1 = "\(Year)"
    let indexStartOfText = str1.index(str1.startIndex, offsetBy: 1)
    let sub = str1.substring(to: indexStartOfText)
   
    
    print (sub)
    speak(say: "\(Intro)")
    
    let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
        speak(say: "\(Year) 年")
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            speak(say: "\(Month) 月")
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
                speak(say: "\(Day) 日")
            }
        }
        
    }
    
    
}

func getToday() -> String{
    let formatter : DateFormatter = DateFormatter()
       formatter.dateFormat = "yyyy/MM/dd"
       let myStr : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
       
       return myStr
}


func getYear() -> String{
    let formatter : DateFormatter = DateFormatter()
          formatter.dateFormat = "yyyy"
          let myStr : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
          
          return myStr
}


func getMonth() -> String{
    let formatter : DateFormatter = DateFormatter()
          formatter.dateFormat = "MM"
          let myStr : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
          
          return myStr
}



func getDate() -> String{
    let formatter : DateFormatter = DateFormatter()
          formatter.dateFormat = "dd"
          let myStr : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
          
          return myStr
}
