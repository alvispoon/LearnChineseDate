//
//  util.swift
//  LearnChineseEveryday
//
//  Created by Alvis Poon on 23/4/2020.
//  Copyright © 2020 Alvis Poon. All rights reserved.
//

import Foundation

import AVFoundation

import UIKit



let chineseNumber : [Character] = ["〇", "一", "二", "三", "四","五", "六", "七", "八", "九"]
//
//func speakAll(synthesizer: AVSpeechSynthesizer,say: String, charLbl: [UILabel]){
//    for i in 0...0{
//        //charLbl[i].textColor = UIColor.red
//        speak(synthesizer: synthesizer, say: String(say[say.index(say.startIndex, offsetBy: i)..<say.index(say.startIndex, offsetBy: i+1)]))
//        
//        
//    }
//}
//
//
//func speak(synthesizer: AVSpeechSynthesizer, say: String) {
//    let utterance = AVSpeechUtterance(string: say)
//    utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
//    utterance.rate = 0.1
//    utterance.pitchMultiplier = 0.5
//    utterance.preUtteranceDelay = 0
//    utterance.volume = 1
//    synthesizer.speak(utterance)
//}

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

func getChineseYear() -> String{
    let year = getYear()
    var chineseYear = ""
    for i in 0 ... year.count-1{
        chineseYear.append(getChineseNumber(fromStr: year, startChar: i))
    }
    return chineseYear
}

func getChineseNumber(fromStr: String, startChar: Int) -> Character{
    let yearInt = Int(fromStr[fromStr.index(fromStr.startIndex, offsetBy: startChar)..<fromStr.index(fromStr.startIndex, offsetBy: startChar+1)])
    return chineseNumber[yearInt!]
}



func getMonth() -> String{
    let formatter : DateFormatter = DateFormatter()
          formatter.dateFormat = "MM"
          let myStr : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
          
          return myStr
}

func getChineseMonth() -> String{
    let month = getMonth()
    var chineseMonth = ""
    for i in 0 ... month.count-1{
        let chineseNum = getChineseNumber(fromStr: month, startChar: i)
        if !(i==0 && chineseNum == chineseNumber[0]){
            if (i==0 && chineseNum == chineseNumber[1]){
                chineseMonth.append("十")
            }else{
                chineseMonth.append(chineseNum)
            }
        }
    }
    return chineseMonth
}



func getDate() -> String{
    let formatter : DateFormatter = DateFormatter()
          formatter.dateFormat = "dd"
          let myStr : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
          
          return myStr
}


func getChineseDate() -> String{
    let date = getDate()
    var chineseDate = ""
    for i in 0 ... date.count-1{
        let chineseNum = getChineseNumber(fromStr: date, startChar: i)
        if !(i==0 && chineseNum == chineseNumber[0]){
            if (i==0 && chineseNum == chineseNumber[1]){
                chineseDate.append("十")
            }else if (i==0 && (chineseNum == chineseNumber[2] || chineseNum == chineseNumber[3])){
                chineseDate.append(chineseNum)
                chineseDate.append("十")
            }
            else{
                if !(i==1 && chineseNum == chineseNumber[0]){
                    chineseDate.append(chineseNum)
                }
            }
        }
    }
    return chineseDate
}
