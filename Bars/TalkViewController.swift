//
//  TalkViewController.swift
//  SpeechKitSample
//
//  Created by Swayam Barik on 7/22/16.
//  Copyright © 2016 Nuance. All rights reserved.
//

import UIKit
import SpeechKit

enum SKSState {
    case SKSIdle
    case SKSListening
    case SKSProcessing
}

var language: String!
var recognitionType: String!
var stopOn: SKTransactionEndOfSpeechDetection!
var skSession:SKSession?
var skTransaction:SKTransaction?
var state = SKSState.SKSIdle
var volumePollTimer: NSTimer?


class TalkViewController: UIViewController, SKTransactionDelegate {

    //golbal variables 
    let LANGUAGE = SKSLanguage == "!LANGUAGE!" ? "eng-USA" : SKSLanguage
    
    
    @IBOutlet weak var label: UILabel!
    // Settings
        @IBOutlet weak var listeningLabel: UILabel!
    @IBOutlet weak var volumeLevelProgressView: UIProgressView?
    var timer = NSTimer()
    let delay = 3.0
    
    
    
        // State Logic: IDLE -> LISTENING -> PROCESSING -> repeat
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runSpeechToText()
        

    }
    
    @IBAction func talkButton(sender: AnyObject) {
        print("button hit")
        //ViewController().api()
        
        switch state {
        case .SKSIdle:
            //begin recording (start on button press), stop on a short pause 
            if let skSession = skSession {
                 skTransaction = skSession.recognizeWithType(recognitionType, detection: stopOn, language: LANGUAGE, delegate: self)
                
                startTimer()
            } else{
                print("skSession was nil")
            }
           
            
        case .SKSListening:
            skTransaction!.stopRecording()
            
        case .SKSProcessing:
            // This will only cancel if we have not received a response from the server yet.
            skTransaction!.cancel()
            
        }
    
        
        
        label.text = ""
    }
    
    func startTalk(){
        print("started process")
        //ViewController().api()
        
        switch state {
        case .SKSIdle:
            //begin recording (start on button press), stop on a short pause
            if let skSession = skSession {
                skTransaction = skSession.recognizeWithType(recognitionType, detection: stopOn, language: LANGUAGE, delegate: self)
                
                startTimer()
            } else{
                print("skSession was nil")
            }
            
            
        case .SKSListening:
            skTransaction!.stopRecording()
            
        case .SKSProcessing:
            // This will only cancel if we have not received a response from the server yet.
            skTransaction!.cancel()
            
        }

    }

    
    func runSpeechToText(){
        recognitionType = SKTransactionSpeechTypeDictation
        stopOn = .Long
        language = LANGUAGE
        
        state = .SKSIdle
        skTransaction = nil
        
        // Create a session
        skSession = SKSession(URL: NSURL(string: SKSServerUrl), appToken: SKSAppKey)
        
        if (skSession == nil) {
            let alertView = UIAlertController(title: "SpeechKit", message: "Failed to initialize SpeechKit session.", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
            alertView.addAction(defaultAction)
            presentViewController(alertView, animated: true, completion: nil)
            return
        }
        
        print("TalkViewController.runSpeechToText works")
        loadEarcons()
    }

    
    func loadEarcons() {
        let startEarconPath = NSBundle.mainBundle().pathForResource("sk_start", ofType: "pcm")
        let stopEarconPath = NSBundle.mainBundle().pathForResource("sk_stop", ofType: "pcm")
        let errorEarconPath = NSBundle.mainBundle().pathForResource("sk_error", ofType: "pcm")
        let audioFormat = SKPCMFormat()
        audioFormat.sampleFormat = .SignedLinear16
        audioFormat.sampleRate = 16000
        audioFormat.channels = 1
        
        
        print("Printing dependencies: StartEarconPath:\(startEarconPath) AudioFormat:\(audioFormat) StopEarconPath:\(stopEarconPath) errorEarconPath: \(errorEarconPath)")
        
        skSession!.startEarcon = SKAudioFile(URL: NSURL(fileURLWithPath: (startEarconPath)!), pcmFormat: audioFormat)
        skSession!.endEarcon = SKAudioFile(URL: NSURL(fileURLWithPath: stopEarconPath!), pcmFormat: audioFormat)
        skSession!.errorEarcon = SKAudioFile(URL: NSURL(fileURLWithPath: errorEarconPath!), pcmFormat: audioFormat)
    }
    
    
    //Transactions
    func recognize() {
        // Start listening to the user.
        skTransaction = skSession!.recognizeWithType(recognitionType, detection: .Short, language: LANGUAGE, delegate: self)
        
    }
    
    
    // MARK: - SKTransactionDelegate
    
    func transactionDidBeginRecording(transaction: SKTransaction!) {
        
        state = .SKSListening
        startPollingVolume()
        //listeningLabel.text = "Now Listening.."
    }
    
    func transactionDidFinishRecording(transaction: SKTransaction!) {
        //listeningLabel.text = "Finished Recording"
        
        state = .SKSProcessing
        stopPollingVolume()
    }
    
    func transaction(transaction: SKTransaction!, didReceiveRecognition recognition: SKRecognition!) {
        
        //In the line below, recognition.text is out message
        //Mark1
        print(recognition.text)
        myText = recognition.text
        wordUni = myText.lastWord
        wordUni = wordUni.lowercaseString
        print(wordUni)
        print("HERE!")
        ViewController().findRhymeWord(wordUni)
        
        
        
        state = .SKSIdle
    }
    

    
    func transaction(transaction: SKTransaction!, didFailWithError error: NSError!, suggestion: String) {
        
        print("There was an error")
        print(error.description + "  \n " + suggestion)
        
        // Something went wrong. Ensure that your credentials are correct.
        // The user could also be offline, so be sure to handle this case appropriately.
        
        state = .SKSIdle
        runSpeechToText()
    }
    
    //Polling volume
    func startPollingVolume() {
        // Every 50 milliseconds we should update the volume meter in our UI.
        volumePollTimer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(SKSNLUViewController.pollVolume), userInfo: nil, repeats: true)
    }
    
    func pollVolume() {
        let volumeLevel = skTransaction!.audioLevel
        //volumeLevelProgressView!.setProgress(volumeLevel / Float(100), animated: true)
    }
    
    func stopPollingVolume() {
        volumePollTimer!.invalidate()
        volumePollTimer = nil
        //volumeLevelProgressView!.setProgress(Float(0), animated: true)
    }
    
    // start timer when button is tapped
    func startTimer() {
        // cancel the timer in case the button is tapped multiple times
        timer.invalidate()
        
        // start the timer
        
        timer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: #selector(delayedAction), userInfo: nil, repeats: false)
    }
    
    
    
    // function to be called after the delay
    func delayedAction() {
        print("skTransaction: \(skTransaction)")
        
        //if there is timing issue, check this error handling thingy bc sometimes timing becomes slow
        //makeshift error-handling?
        if skTransaction == nil{
            skTransaction?.cancel()
        }
        print("timer ended stopped recording")
    }


    
}

extension String {
    var byWords: [String] {
        var result:[String] = []
        enumerateSubstringsInRange(characters.indices, options: .ByWords) {
            guard let substring = $0.substring else { return }
            result.append(substring)
        }
        return result
    }
    var lastWord: String {
        return byWords.last ?? ""
    }
    func lastWords(maxWords: Int) -> [String] {
        return Array(byWords.suffix(maxWords))
    }
}
