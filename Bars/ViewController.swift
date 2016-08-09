//
//  ViewController.swift
//  Bars
//
//  Created by Swayam Barik on 7/14/16.
//  Copyright © 2016 Swayam Barik. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator
import SpeechKit


class ViewController: UIViewController {
    
    var time : Float = 0.0
    var timer = NSTimer()
    var word: String = ""
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var rhymeWord: UILabel!
    
//    var label = UILabel()
    
    @IBOutlet weak var rWord1: UILabel!
    @IBOutlet weak var rWord2: UILabel!
    @IBOutlet weak var rWord3: UILabel!
    @IBOutlet weak var rWord4: UILabel!
    @IBOutlet weak var rWord5: UILabel!
    @IBOutlet weak var rWord6: UILabel!
    
    @IBOutlet weak var bWord1: UIButton!
    @IBOutlet weak var bWord2: UIButton!
    
    @IBOutlet weak var cWord1: UIButton!
    @IBOutlet weak var cWord2: UIButton!
    
    @IBOutlet weak var dWord1: UIButton!
    @IBOutlet weak var dWord2: UIButton!
    
    @IBOutlet weak var eWord1: UIButton!
    @IBOutlet weak var eWord2: UIButton!
    
    var labels:[UILabel] = []
    
    var rhymeArray: [String] = []
    var storArray1: [String] = []
    var storArray2: [String] = []
    var storArray3: [String] = []
    var storArray4: [String] = []
    
    var exampleInts = [0,1,2,3,4,5,6,7,8,9] //change this after updating the database
    var examplePositions = [0,1,2,3,4,5,6]
    var randomInt = 0
    var randomIndex = 0
    var randomRhymeRow = 0
    var random1 = 0
    var random2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        BackgroundMusic.playMusic()
        //
        //        randomAWordGenerator()
        //        randomAlternateGenerator()
        //
        //        var helloWorldTimer = NSTimer.scheduledTimerWithTimeInterval(8.1, target: self, selector: #selector(ViewController.randomAlternateGenerator), userInfo: nil, repeats: true)
        //
        //        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector:#selector(ViewController.setProgress), userInfo: nil, repeats: true)
        
        //        again()
        
        TalkViewController().runSpeechToText()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:#selector(ViewController.loadLabels), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func b1Action(sender: AnyObject) {
        buttonChange(storArray1)
    }
    @IBAction func b2Action(sender: AnyObject) {
        buttonChange(storArray1)
    }
    @IBAction func c1Action(sender: AnyObject) {
        buttonChange(storArray2)
    }
    @IBAction func c2Action(sender: AnyObject) {
        buttonChange(storArray2)
    }
    @IBAction func d1Action(sender: AnyObject) {
        buttonChange(storArray3)
    }
    @IBAction func d2Action(sender: AnyObject) {
        buttonChange(storArray3)
    }
    @IBAction func e1Action(sender: AnyObject) {
        buttonChange(storArray4)
    }
    @IBAction func e2Action(sender: AnyObject) {
        buttonChange(storArray4)
    }
    
    @IBAction func testApp(sender: AnyObject) {
        print("WePressed Button!")
        TalkViewController().startTalk()
        
    }
    
    
    var cliffRhymes: [String] = ["","","","","",""]
    
    func again(){
        //        rhymeWord.text = "again"
        //
        //        labels[0].text = "again"
    }
    
    var indexRow = 0
    var indexColumn = 0
    
    func findRhymeWord(spokenWord: String){
        //search through local database and get position of the spoken word
        for row in 0...(exampleRhymes.count-1) {
            for column in 0...(exampleRhymes[row].count-1){
                if spokenWord == exampleRhymes[row][column]{
                    indexRow = row
                    indexColumn = column
                    found = true
                    print("row: \(indexRow)")
                    print("column: \(indexColumn)")
                }
            }
        }
        //setSpokenRhymes()
        
        if found == true{
            setSpokenRhymes()
        }
        else{
            print("spokenWord \(spokenWord)")
            api(spokenWord)
        }
        
        //if not found, search through rhyme API
    }
    
    
    
    
    func setSearchedWords(){
        
        examplePositions = []
        
        
        //api(wordUni)
//        print("solidRhymes.count:  \(solidRhymes.count)")
        
        //        let cliffword = cliffReturn().word
        //        print(cliffword)
        //        print(rWord1)
        //        labels[0].text = "work!!"
        
//        cliffRhymes = ["","","","","",""]
//        var county = 0
//        while county < 6
//        {
//        for county in 0..<6 {
//            //            cliffRhymes.append(cliffReturn().word)
//            let temp = cliffReturn().word
//            print(temp)
//            cliffRhymes[county] = temp
////            county += 1
//        }
        
//        rWord1.text = "stuff"
//        rWord2.text = cliffReturn().word
//        rWord3.text = cliffReturn().word
//        rWord4.text = cliffReturn().word
//        rWord5.text = cliffReturn().word
//        rWord6.text = cliffReturn().word
        
//        print(cliffRhymes)
        
        var label = UILabel(frame: CGRectMake(200, 200, 200, 100)) // (x position, y position, width, height)
        label.backgroundColor = UIColor.yellowColor()
        label.textAlignment = NSTextAlignment.Center
        
        label.font = UIFont(name: "Menlo", size: 30)
        label.textColor = UIColor.blackColor()
        label.text = cliffReturn().word
        print(label.text)
        self.view.addSubview(label)
        
        //loadLabels()
        
        
        //        for int in 0...solidRhymes.count-1{
        //            examplePositions.append(int)
        //        }
        //
        //        if examplePositions.count < 6{
        //            var currentCount = examplePositions.count
        //            randomInt = Int(arc4random_uniform(UInt32(currentCount)))
        //            var actualInt = examplePositions[randomInt]
        //            examplePositions.removeAtIndex(randomInt) //suspect
        //
        //            if currentCount == 5{
        //                rWord1.text = solidRhymes[actualInt].word
        //
        //                random1 = actualInt
        //            }
        //            else if currentCount == 4{
        //                rWord2.text = solidRhymes[actualInt].word
        //
        //                random2 = actualInt
        //            }
        //            else if currentCount == 3{
        //                rWord3.text = solidRhymes[actualInt].word
        //
        //            }
        //            else if currentCount == 2{
        //                rWord4.text = solidRhymes[actualInt].word
        //
        //            }
        //            else if currentCount == 1{
        //                rWord5.text = solidRhymes[actualInt].word
        //
        //            }
        //            else{
        //                rWord6.text = solidRhymes[actualInt].word
        //
        //            }
        //        }
        
        
        //        var counter = examplePositions.count-6
        
        //        var internalCounter = 0
        
        
        //        while internalCounter < 6
        //        {
        //
        //            if internalCounter == 0{
        //                var cliffword = cliffReturn().word
        //                print(cliffword)
        //
        //                //if let rWord1 = rWord1 {
        //                    print(rWord1)
        //                    labels[0].text = "work!!"
        ////                } else {
        ////                    print("rWord1 is nil")
        ////                }
        //
        //            }
        //            else if internalCounter == 0{
        //                rWord2.text = cliffReturn().word
        //                //                    print(randomRhymeWord)
        //                //                    random2 = actualInt
        //            }
        //            else if internalCounter == 2{
        //                rWord3.text = cliffReturn().word
        //                //                    print(randomRhymeWord)
        //            }
        //            else if internalCounter == 3{
        //                rWord4.text = cliffReturn().word
        //                //                    print(randomRhymeWord)
        //            }
        //            else if internalCounter == 4{
        //                rWord5.text = cliffReturn().word
        //                //                    print(randomRhymeWord)
        //            }
        //            else{
        //                rWord6.text = cliffReturn().word
        //                //                    print(randomRhymeWord)
        //            }
        //            internalCounter += 1
        //        }
        
        
        
    }
    
    
    //function takes rhyme word and searches api and updates array solidRhymes with 300> score rhymes
    func api(searchWord: String){
        
        let apiToContact = "http://rhymebrain.com/talk?function=getRhymes&word=\(searchWord)"
        // This code will call the rhyming words
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let rhymeData = JSON(value)
                    
                    for thing in 0...rhymeData.count-1{
                        rhymeAPIArray.append(WordAPI(json: rhymeData[thing]))
                    }
                    //rhymeAPIArray
                    //let allRhymeData = rhymeData.arrayValue
                    
                    //print("Count: \(rhymeAPIArray.count)")
                    
                    //print(rhymeAPIArray)
                    
                    for thing in 0...rhymeAPIArray.count-1{
                        if rhymeAPIArray[thing].score >= 300{
                            solidRhymes.append(rhymeAPIArray[thing])
                        }
                    }
//                    print(solidRhymes)
//                    print("solidRhymes.count \(solidRhymes.count)")
                    
                    
                    self.again()
                    
                    self.setSearchedWords()
                    
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func setSpokenRhymes(){
        
        var indexedArray = exampleRhymes[indexRow]
        
        examplePositions = [0,1,2,3,4,5,6,7,8,9,10]
        
        //search through the indexed array for the word, and remove the word when found
        for word in 0...indexedArray.count-1{
            if indexedArray[word] == wordUni {
                indexedArray.removeAtIndex(word)
                //examplePositions.removeAtIndex(word)
                break
            }
        }
        
        while examplePositions.count > 5
        {
            var currentCount = examplePositions.count
            randomInt = Int(arc4random_uniform(UInt32(currentCount)))
            var actualInt = examplePositions[randomInt]
            var randomRhymeWord = indexedArray[actualInt]
            examplePositions.removeAtIndex(randomInt)
            
            if currentCount == 11{
                //rWord1.text = randomRhymeWord
                print(randomRhymeWord)
                random1 = actualInt
            }
            else if currentCount == 10{
                //rWord2.text = randomRhymeWord
                print(randomRhymeWord)
                random2 = actualInt
            }
            else if currentCount == 9{
                //rWord3.text = randomRhymeWord
                print(randomRhymeWord)
            }
            else if currentCount == 8{
                //rWord4.text = randomRhymeWord
                print(randomRhymeWord)
            }
            else if currentCount == 7{
                //rWord5.text = randomRhymeWord
                print(randomRhymeWord)
            }
            else{
                //rWord6.text = randomRhymeWord
                print(randomRhymeWord)
            }
        }
        
    }
    
    func cliffReturn () -> WordAPI {
        randomInt = Int(arc4random_uniform(UInt32(solidRhymes.count)))
//        print("RANDOM INT: \(randomInt)")
        return solidRhymes.removeAtIndex(randomInt)
    }
    
    func updateExampleInts(array: [Int])
    {
        //load number 0 to n-1 in this array for indexing the array in the app
        exampleInts = []
        var counter = exampleRhymes.count - 1
        for int in  0...counter{
            exampleInts.append(int)
        }
    }
    
    func randomAWordGenerator(){
        updateExampleInts(exampleInts)
        var number = exampleRhymes.count + 1
        randomInt = Int(arc4random_uniform(UInt32(number))) //picks random number from 0 - one less than the number
        print("First randomInt = \(randomInt)")
        
        for int in exampleInts // goes through the number array
        {
            if int == randomInt
            {
                randomIndex = int //sets index to the randomInt for removal in the int array
            }
        }
        print("randomIndex = \(randomIndex)")
        
        for rhyme in exampleRhymes[randomIndex] //goes through the random rhyme array at random row
        {
            rhymeArray.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("rhymeArray: ")
        print(rhymeArray)
        
        exampleInts.removeAtIndex(randomIndex)
        
        print("example ints: ")
        print(exampleInts)
        
        
        while examplePositions.count > 0
        {
            var currentCount = examplePositions.count
            print("Current Count: \(currentCount)")
            randomInt = Int(arc4random_uniform(UInt32(currentCount)))
            var actualInt = examplePositions[randomInt]
            print("RandomInt: \(randomInt)")
            print("Actual Int: \(randomInt)")
            print("RHYME ARRAY: \(rhymeArray)")
            var randomRhymeWord = rhymeArray[actualInt]
            
            print("randomRhymeWord: \(randomRhymeWord)")
            examplePositions.removeAtIndex(randomInt)
            
            print("example Positions: ")
            print(examplePositions)
            
            if currentCount == 6{
                rhymeWord.text = randomRhymeWord
                random1 = actualInt
            }
            else if currentCount == 5{
                rWord1.text = randomRhymeWord
                random2 = actualInt
            }
            else if currentCount == 4{
                rWord2.text = randomRhymeWord
            }
            else if currentCount == 3{
                rWord3.text = randomRhymeWord
            }
            else if currentCount == 2{
                rWord4.text = randomRhymeWord
            }
            else if currentCount == 1{
                rWord5.text = randomRhymeWord
            }
            else{
                rWord6.text = randomRhymeWord
            }
        }
        print("rhymeArray: ")
        print(rhymeArray)
        
    }
    
    func changeAAWords() {
        
        while examplePositions.count > 0
        {
            var currentCount = examplePositions.count
            print("Current Count: \(currentCount)")
            randomInt = Int(arc4random_uniform(UInt32(currentCount)))
            var actualInt = examplePositions[randomInt]
            print("RandomInt: \(randomInt)")
            print("Actual Int: \(randomInt)")
            print("RHYME ARRAY: \(rhymeArray)")
            
            
            var randomRhymeWord = storArray1[actualInt]
            
            print("randomRhymeWord: \(randomRhymeWord)")
            examplePositions.removeAtIndex(randomInt)
            
            print("example Positions: ")
            print(examplePositions)
            
            if currentCount == 6{
                rhymeWord.text = randomRhymeWord
                random1 = actualInt
            }
            else if currentCount == 5{
                rWord1.text = randomRhymeWord
                random2 = actualInt
            }
            else if currentCount == 4{
                rWord2.text = randomRhymeWord
            }
            else if currentCount == 3{
                rWord3.text = randomRhymeWord
            }
            else if currentCount == 2{
                rWord4.text = randomRhymeWord
            }
            else if currentCount == 1{
                rWord5.text = randomRhymeWord
            }
            else{
                rWord6.text = randomRhymeWord
            }
        }
        print("rhymeArray: ")
        print(rhymeArray)
    }
    
    
    func randomAlternateGenerator(){
        var count = 4
        print("timeChanges")
        
        while count > 0
        {
            print("count: \(count)")
            var arrayCount = exampleInts.count
            print("array Count: \(arrayCount)")
            randomInt = Int(arc4random_uniform(UInt32(arrayCount)))
            print("randomInt = \(randomInt)")
            
            var actual = exampleInts[randomInt]
            var arrayChosen = exampleRhymes[actual]
            
            print("arrayChosen: \(arrayChosen)")
            exampleInts.removeAtIndex(randomInt)
            
            if count == 4{
                print("I go in 4")
                self.bWord1.setTitle(arrayChosen[random1], forState: UIControlState.Normal)
                self.bWord1.setTitle(arrayChosen[random1], forState: UIControlState.Highlighted)
                
                storArray1 = arrayChosen
                self.bWord2.setTitle(arrayChosen[random2], forState: UIControlState.Normal)
                self.bWord2.setTitle(arrayChosen[random2], forState: UIControlState.Highlighted)
            }
            else if count == 3{
                print("I go in 3")
                self.cWord1.setTitle(arrayChosen[random1], forState: UIControlState.Normal)
                self.cWord1.setTitle(arrayChosen[random1], forState: UIControlState.Highlighted)
                storArray2 = arrayChosen
                
                self.cWord2.setTitle(arrayChosen[random2], forState: UIControlState.Normal)
                self.cWord2.setTitle(arrayChosen[random2], forState: UIControlState.Highlighted)
            }
            else if count == 2{
                print("I go in 2")
                self.dWord1.setTitle(arrayChosen[random1], forState: UIControlState.Normal)
                self.dWord1.setTitle(arrayChosen[random1], forState: UIControlState.Highlighted)
                storArray3 = arrayChosen
                
                self.dWord2.setTitle(arrayChosen[random2], forState: UIControlState.Normal)
                self.dWord2.setTitle(arrayChosen[random2], forState: UIControlState.Highlighted)
            }
            else {
                print("I go in 1")
                self.eWord1.setTitle(arrayChosen[random1], forState: UIControlState.Normal)
                self.eWord1.setTitle(arrayChosen[random1], forState: UIControlState.Highlighted)
                storArray4 = arrayChosen
                
                self.eWord2.setTitle(arrayChosen[random2], forState: UIControlState.Normal)
                self.eWord2.setTitle(arrayChosen[random2], forState: UIControlState.Highlighted)
            }
            
            count -= 1
            print("what is my count" + String(count))
        }
        
        rhymeArray = []
        updateExampleInts(exampleInts)
        examplePositions = [0,1,2,3,4,5,6]
    }
    
    func buttonChange( var arrayButton: [String]){
        randomInt = Int(arc4random_uniform(9 + 1)) //picks random number from 0 - 9
        print("First randomInt = \(randomInt)")
        for int in exampleInts // goes through the number array
        {
            if int == randomInt
            {
                randomIndex = int //sets index to the randomInt for removal in the int array
            }
        }
        print("randomIndex = \(randomIndex)")
        
        for rhyme in rhymeArray //goes through the random rhyme array at random row
        {
            arrayButton.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray1: ")
        print(arrayButton)
        
        examplePositions = [0,1,2,3,4,5,6,7,8,9,10,11]
        
        while examplePositions.count > 0
        {
            var currentCount = examplePositions.count
            print("Current Count: \(currentCount)")
            randomInt = Int(arc4random_uniform(UInt32(currentCount)))
            var actualInt = examplePositions[randomInt]
            print("RandomInt: \(randomInt)")
            print("Actual Int: \(randomInt)")
            print("RHYME ARRAY: \(rhymeArray)")
            
            
            var randomRhymeWord = arrayButton[actualInt]
            
            print("randomRhymeWord: \(randomRhymeWord)")
            examplePositions.removeAtIndex(randomInt)
            
            print("example Positions: ")
            print(examplePositions)
            
            if currentCount == 11{
                rhymeWord.text = randomRhymeWord
                random1 = actualInt
            }
            else if currentCount == 10{
                rWord1.text = randomRhymeWord
                random2 = actualInt
            }
            else if currentCount == 9{
                rWord2.text = randomRhymeWord
            }
            else if currentCount == 8{
                rWord3.text = randomRhymeWord
            }
            else if currentCount == 7{
                rWord4.text = randomRhymeWord
            }
            else if currentCount == 6{
                rWord5.text = randomRhymeWord
            }
            else{
                rWord6.text = randomRhymeWord
            }
        }
    }
    
    func setProgress() {
        time += 0.1
        progressBar.progress = time / 8.1
        if time >= 8.1 {
            time = 0.1
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadLabels(){
//        if cliffRhymes[0] == "" {
//            print("empty")
//        }
        // label exists
//        rWord1.text = "(cliffRhymes[0])"
        //        rWord2.text = "\(cliffRhymes[1])"
        //        rWord3.text = "\(cliffRhymes[2])"
        //        rWord4.text = "\(cliffRhymes[3])"
        //        rWord5.text = "\(cliffRhymes[4])"
        //        rWord6.text = "\(cliffRhymes[5])"
    }
    
}

//extension ViewController {
//    
//    func loadLabels(){
//        rWord1.text = cliffRhymes[0]
//        rWord2.text = cliffRhymes[1]
//        rWord3.text = cliffRhymes[2]
//        rWord4.text = cliffRhymes[3]
//        rWord5.text = cliffRhymes[4]
//        rWord6.text = cliffRhymes[5]
//    }
//    
//}





