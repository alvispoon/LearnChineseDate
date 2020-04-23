//
//  ViewController.swift
//  LearnChineseEveryday
//
//  Created by Alvis Poon on 23/4/2020.
//  Copyright © 2020 Alvis Poon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//
//
//    String[] units = new String[] { "〇", "一", "二", "三", "四",
//            "五", "六", "七", "八", "九"};
    
    let chineseNumber : [String] = ["〇", "一", "二", "三", "四","五", "六", "七", "八", "九"]

    @IBOutlet weak var speakerImage: UIImageView!
    @IBOutlet weak var year1: UILabel!
    @IBOutlet weak var year2: UILabel!
    @IBOutlet weak var year3: UILabel!
    @IBOutlet weak var year4: UILabel!
    
    @IBOutlet weak var month1: UILabel!
    @IBOutlet weak var month2: UILabel!
    
    
    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var day2: UILabel!
    
    @IBOutlet weak var dayTEN: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getToday()
        // Do any additional setup after loading the view.
        speakNow(Intro: "今天是", Year: getYear(), Month: getMonth(), Day: getDate())
        
        let yearStr = getYear()
        let monthStr = getMonth()
        let dayStr = getDate()
        
        let yearInt = Int(yearStr[yearStr.index(yearStr.startIndex, offsetBy: 0)..<yearStr.index(yearStr.startIndex, offsetBy: 1)])
        let yearChinese = chineseNumber[yearInt!]
        print (getChineseNumber(fromStr: yearStr, startChar: 2))
        
        year1.text = getChineseNumber(fromStr: yearStr, startChar: 0)
        year2.text = getChineseNumber(fromStr: yearStr, startChar: 1)
        year3.text = getChineseNumber(fromStr: yearStr, startChar: 2)
        year4.text = getChineseNumber(fromStr: yearStr, startChar: 3)
        
        let dayInt = Int(dayStr)

        
        if ((dayInt!>20) && !(dayInt! == 30)){
            dayTEN.isHidden = false
            dayTEN.text = "十"
        }else{
            dayTEN.isHidden = true
        }
        

        
        month1.text = getChineseNumber(fromStr: monthStr, startChar: 0)
        month2.text = getChineseNumber(fromStr: monthStr, startChar: 1)
        day1.text = getChineseNumber(fromStr: dayStr, startChar: 0)
        day2.text = getChineseNumber(fromStr: dayStr, startChar: 1)
        
        if (month1.text == chineseNumber[0]){
            month1.isHidden = true
        }else{
            month1.isHidden = false
        }
        if (day1.text == chineseNumber[0]){
            day1.isHidden = true
        }else{
            day1.isHidden = false
        }
        //year1.text = chineseNumber[5]
        
         speakerImage.isUserInteractionEnabled = true
         // Create and add the Gesture Recognizer
        let speakgesture = UITapGestureRecognizer(target: self, action: #selector(speakDate))
         speakerImage.addGestureRecognizer(speakgesture)

    }
    @objc func speakDate(_ sender: Any) {
             print ("a")
           speakNow(Intro: "今天是", Year: getYear(), Month: getMonth(), Day: getDate())
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

    func getChineseNumber(fromStr: String, startChar: Int) -> String{
        let yearInt = Int(fromStr[fromStr.index(fromStr.startIndex, offsetBy: startChar)..<fromStr.index(fromStr.startIndex, offsetBy: startChar+1)])
        return chineseNumber[yearInt!]
    }

}

