//
//  ViewController.swift
//  Bars
//
//  Created by Swayam Barik on 7/14/16.
//  Copyright © 2016 Swayam Barik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    
    
    
//    @IBOutlet weak var bWord1: UILabel!
//    @IBOutlet weak var bWord2: UILabel!
//    
//    @IBOutlet weak var cWord1: UILabel!
//    @IBOutlet weak var cWord2: UILabel!
//    
//    @IBOutlet weak var dWord1: UILabel!
//    @IBOutlet weak var dWord2: UILabel!
//    
//    @IBOutlet weak var eWord1: UILabel!
//    @IBOutlet weak var eWord2: UILabel!
    
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
    //var storArray: [String] = []
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
            storArray1.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray1: ")
        print(storArray1)
        
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
        

        
        
    }
    @IBAction func b2Action(sender: AnyObject) {
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
            storArray1.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray1: ")
        print(storArray1)
        
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

    }
    @IBAction func c1Action(sender: AnyObject) {
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
            storArray2.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray2: ")
        print(storArray2)
        
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
            
            
            var randomRhymeWord = storArray2[actualInt]
            
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
    @IBAction func c2Action(sender: AnyObject) {
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
            storArray2.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray2: ")
        print(storArray2)
        
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
            
            
            var randomRhymeWord = storArray2[actualInt]
            
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
    @IBAction func d1Action(sender: AnyObject) {
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
            storArray3.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray3: ")
        print(storArray3)
        
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
            
            
            var randomRhymeWord = storArray3[actualInt]
            
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
    @IBAction func d2Action(sender: AnyObject) {
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
            storArray3.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray3: ")
        print(storArray3)
        
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
            
            
            var randomRhymeWord = storArray3[actualInt]
            
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
    @IBAction func e1Action(sender: AnyObject) {
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
            storArray4.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray4: ")
        print(storArray4)
        
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
            
            
            var randomRhymeWord = storArray4[actualInt]
            
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
    @IBAction func e2Action(sender: AnyObject) {
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
            storArray4.append(rhyme) //adds all the rhymes in the rhyme array
        }
        print("storArray4: ")
        print(storArray4)
        
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
            
            
            var randomRhymeWord = storArray4[actualInt]
            
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
        
        
        
//        exampleInts.removeAtIndex(randomIndex)
//        
//        print("example ints: ")
//        print(exampleInts)
        
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
                //bWord1.titleLabel?.text = arrayChosen[random1]
                //bWord2.titleLabel?.text = arrayChosen[random2]
            }
            else if count == 3{
                print("I go in 3")
                self.cWord1.setTitle(arrayChosen[random1], forState: UIControlState.Normal)
                self.cWord1.setTitle(arrayChosen[random1], forState: UIControlState.Highlighted)
                storArray2 = arrayChosen
                
                self.cWord2.setTitle(arrayChosen[random2], forState: UIControlState.Normal)
                self.cWord2.setTitle(arrayChosen[random2], forState: UIControlState.Highlighted)

//                cWord1.titleLabel?.text = arrayChosen[random1]
//                cWord2.titleLabel?.text = arrayChosen[random2]
            }
            else if count == 2{
                print("I go in 2")
                self.dWord1.setTitle(arrayChosen[random1], forState: UIControlState.Normal)
                self.dWord1.setTitle(arrayChosen[random1], forState: UIControlState.Highlighted)
                storArray3 = arrayChosen
                
                self.dWord2.setTitle(arrayChosen[random2], forState: UIControlState.Normal)
                self.dWord2.setTitle(arrayChosen[random2], forState: UIControlState.Highlighted)

//                dWord1.titleLabel?.text = arrayChosen[random1]
//                dWord2.titleLabel?.text = arrayChosen[random2]
            }
            else {
                print("I go in 1")
                self.eWord1.setTitle(arrayChosen[random1], forState: UIControlState.Normal)
                self.eWord1.setTitle(arrayChosen[random1], forState: UIControlState.Highlighted)
                storArray4 = arrayChosen
                
                self.eWord2.setTitle(arrayChosen[random2], forState: UIControlState.Normal)
                self.eWord2.setTitle(arrayChosen[random2], forState: UIControlState.Highlighted)
                
//                eWord1.titleLabel?.text = arrayChosen[random1]
//                eWord2.titleLabel?.text = arrayChosen[random2]
            }
            
            //exampleInts.removeAtIndex(randomInt)
            count -= 1
            print("what is my count" + String(count))
        }
        
        rhymeArray = []
        exampleInts = [0,1,2,3,4,5,6,7,8,9]
        examplePositions = [0,1,2,3,4,5,6]
    }
    
    func randomWordGenerator(){
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
        
        
        var count = 4
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
                self.bWord1.setTitle(" brexit ", forState: UIControlState.Normal)
                self.bWord1.setTitle(" brexit", forState: UIControlState.Highlighted)
//                self.bWord1.titleLabel?.text = arrayChosen[random1]
                self.bWord2.titleLabel?.text = arrayChosen[random2]
            }
            else if count == 3{
                self.cWord1.titleLabel?.text = arrayChosen[random1]
                self.cWord2.titleLabel?.text = arrayChosen[random2]
            }
            else if count == 2{
                self.dWord1.titleLabel?.text = arrayChosen[random1]
                self.dWord2.titleLabel?.text = arrayChosen[random2]
            }
            else {
                self.eWord1.titleLabel?.text = arrayChosen[random1]
                self.eWord2.titleLabel?.text = arrayChosen[random2]
            }
            //exampleInts.removeAtIndex(randomInt)
            count -= 1
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
        var helloWorldTimer = NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector: Selector("randomAlternateGenerator"), userInfo: nil, repeats: true)
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

