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

class ViewController: UIViewController {
    
    var time : Float = 0.0
    var timer: NSTimer?
    var word: String = ""

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var rhymeWord: UILabel!
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
    
    var exampleRhymes = [
    ["snack","black","shack","positive feedback","stack","crack", "paperback", "pack", "asthma attack", "hack", "rack", "insomniac"],
    ["phone","clone","homegrown","bone","loan","stone", "drone", "postpone", "gemstone", "microphone", "rosetta stone", "testosterone"],
    ["hop","drop","stop","pop","cop","flop", "shop", "workshop", "lollipop", "mall cop", "tabletop", "eavesdrop"],
    ["flag","lag","swag","tag","brag","drag", "rag", "zig-zag", "nag", "sag", "royal stag", "tool bag"],
    ["wish","fish","squish","delish'","swish","dish", "kiss", "selfish", "catfish", "knish", "niche", "jelyfish"],
    ["applying","flying","crying","spying","sighing","dying", "supplying", "electrifying", "oversimplifying", "identifying", "denying", "disqualifying"],
    ["short","sport","import","thwart","court","fort", "sort", "financial support", "medical report", "holiday resort", "airport", "escort"],
    ["supporter","reporter","shorter","mortar","transporter","quarter","exporter", "snorter", "importer", "sorter", "court her", "deport her"],
    ["beast","priest","deceased","feast","least","increased","east", "ceased", "yeast", "greased", "middle east", "released"],
    ["way","day","getaway","airway","slay","spray","tray", "radioactive decay", "hideaway", "clay", "paraguay", "lingerie"],
    ["computer", "hooter", "tutor", "scooter", "shooter", "commuter", "persecutor", "suitor", "", "", "", ""],
    ["slow", "glow", "grow", "throw", "combo", "free throw", "status quo", "tornado", "indigo", "potato", "pistachio", "tomorrow"],
    ["dog", "frog", "fog", "smog", "underdog", "dialouge", "demagogue", "analog", "catalogue", "jog", "hedgehog", "monologue"],
    ["beat", "feet", "eat", "suite", "heat", "wall street", "petite", "concrete", "seat", "trick or treat", "street", "fleet"],
    ["bars", "stars", "mars", "cars", "tzars", "bazaars", "guitars", "memoirs", "handlebars", "superstars", "seminars", "scars"],
    ["now", "how", "meow", "you can bow", "highbrow", "endow", "plow", "eyebrow", "chow", "up until now", "cash cow", "somehow", "just now"],
    ["rattlesnake", "bake", "shake", "fake", "make", "take", "stake", "mistake", "cake", "headache", "emergency brake", "uptake"],
    ["crises", "slices", "spices", "devices", "vices", "prices", "sacrifices", "suffices", "entices", "advise his", "biases", "revises"],
    ["rap", "app", "cap", "lap", "wiretap", "recap", "asap", "trap", "scrap",  "kidnap", "shrink wrap", "slap", "nap", "tap", "zap", "flap", "clap", "strap", "map", "booby trap", "zap"],
    ["flip", "dip", "strip", "lip", "tie clip", "scholarship", "citizenship", "dictatorship", "spaceship", "battleship", "road trip", "warship", "whip"],
    ["school", "cool", "drool", "piano stool", "dipole molecule",  "swimming pool", "ridicule", "april fool", "you’re a fool", "tool", "jewel", "fuel", "mule"],
    ["tsunami", "umami", "salami", "pastrami", "origami", "your mommy", "swami", "call me", "johnny", "draw me", "massage me", "scrawny"]
    ]
    
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
    
    var indexRow = 0
    var indexColumn = 0

    func findRhymeWord(spokenWord: String){
        //search through local database and get position of the spoken word
        for row in 0...(exampleRhymes.count-1) {
            for column in 0...(exampleRhymes[row].count-1){
                if spokenWord == exampleRhymes[row][column]{
                    indexRow = row
                    indexColumn = column
                    print("row: \(indexRow)")
                    print("column: \(indexColumn)")
                }
            }
        }
        setSpokenRhymes()
        
        //if not found, search through rhyme API
        
    }
    
    func api(){
        
        let apiToContact = "http://rhymebrain.com/talk?function=getRhymes&word=\(wordUni)"
        // This code will call the rhyming words
        Alamofire.request(.GET, apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let rhymeData = JSON(value)
                    //let allRhymeData = rhymeData.arrayValue
                print(rhymeData)
                    
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
        
        while examplePositions.count > 0
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackgroundMusic.playMusic()
        
        randomAWordGenerator()
        randomAlternateGenerator()
        
        var helloWorldTimer = NSTimer.scheduledTimerWithTimeInterval(8.1, target: self, selector: #selector(ViewController.randomAlternateGenerator), userInfo: nil, repeats: true)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector:#selector(ViewController.setProgress), userInfo: nil, repeats: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}





