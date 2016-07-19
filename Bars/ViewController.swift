//
//  ViewController.swift
//  Bars
//
//  Created by Swayam Barik on 7/14/16.
//  Copyright © 2016 Swayam Barik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time : Float = 0.0
    var timer: NSTimer?

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
    ["snack","black","shack","whack","stack","crack", "back"],
    ["phone","clone","grown","bone","loan","stone", "drone"],
    ["hop","drop","stop","pop","cop","flop", "shop"],
    ["flag","lag","swag","tag","brag","drag", "rag"],
    ["wish","fish","squish","delish'","swish","dish", "kiss"],
    ["applying","flying","crying","spying","sighing","dying", "supplying"],
    ["short","sport","import","thwart","court","fort", "sort"],
    ["supporter","reporter","shorter","mortar","transporter","quarter","exporter"],
    ["beast","priest","deceased","feast","least","increased","east"],
    ["way","day","getaway","decay","slay","spray","tray"]]
    
    var rhymeArray: [String] = []
    var storArray1: [String] = []
    var storArray2: [String] = []
    var storArray3: [String] = []
    var storArray4: [String] = []
    var exampleInts = [0,1,2,3,4,5,6,7,8,9]
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
    
    func randomAWordGenerator(){
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
        exampleInts = [0,1,2,3,4,5,6,7,8,9]
        examplePositions = [0,1,2,3,4,5,6]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        randomAWordGenerator()
        randomAlternateGenerator()
        var helloWorldTimer = NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, selector: Selector("randomAlternateGenerator"), userInfo: nil, repeats: true)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector:Selector("setProgress"), userInfo: nil, repeats: true)
    }
    
    func buttonChange(var arrayButton: [String]){
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
        
        examplePositions = [0,1,2,3,4,5,6]
        
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
    }

    func setProgress() {
        time += 0.1
        progressBar.progress = time / 4
        if time >= 4 {
            time = 0.1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

