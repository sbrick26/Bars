//
//  SKSNLUViewController.swift
//  SpeechKitSample
//
//  This Controller is built to demonstrate how to perform NLU (Natural Language Understanding).
//
//  This Controller is very similar to SKSASRViewController. Much of the code is duplicated for clarity.
//
//  NLU is the transformation of text into meaning.
//
//  When performing speech recognition with SpeechKit, you have a variety of options. Here we demonstrate
//  Detection Type and Language.
//
//  The Context Tag is assigned in the system configuration upon deployment of an NLU model.
//  Combined with the App ID, it will be used to find the correct NLU version to query.
//
//  Languages can also be configured. Supported languages can be found here:
//  http://dragonmobile.nuancemobiledeveloper.com/public/index.php?task=supportedLanguages
//
//  Copyright (c) 2015 Nuance Communications. All rights reserved.
//

import UIKit
import SpeechKit

class SKSNLUViewController : UIViewController, UITextFieldDelegate, SKTransactionDelegate {
    
    // State Logic: IDLE -> LISTENING -> PROCESSING -> repeat
    enum SKSState {
        case SKSIdle
        case SKSListening
        case SKSProcessing
    }
    
    // User interface
    @IBOutlet weak var toggleRecogButton: UIButton?
    @IBOutlet weak var logTextView: UITextView?
    @IBOutlet weak var clearLogsButton: UIButton?
    @IBOutlet weak var endpointerTypeSegmentControl: UISegmentedControl?
    @IBOutlet weak var volumeLevelProgressView: UIProgressView?
    @IBOutlet weak var contextTagTextView: UITextField?
    @IBOutlet weak var languageTextView: UITextField?
    
    // Settings
    var language: String!
    var contextTag: String!
    var endpointer: SKTransactionEndOfSpeechDetection!
    
    var skSession:SKSession?
    var skTransaction:SKTransaction?
    
    var state = SKSState.SKSIdle
    
    var volumePollTimer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endpointer = .Short
        language = LANGUAGE
        self.languageTextView!.text = language
        contextTag = SKSNLUContextTag
        self.contextTagTextView!.text = contextTag
        
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
        
        loadEarcons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - ASR Actions
    @IBAction func toggleRecognition() {
        switch state {
        case .SKSIdle:
            recognize()
        case .SKSListening:
            stopRecording()
        case .SKSProcessing:
            cancel()
        }
    }
    
    func recognize() {
        // Start listening to the user.
        toggleRecogButton?.setTitle("Stop", forState: .Normal)
        skTransaction = skSession!.recognizeWithService(contextTag,
                                                        detection: endpointer,
                                                        language: language,
                                                        data: nil,
                                                        delegate: self)
    }
    
    func stopRecording() {
        // Stop recording the user.
        skTransaction!.stopRecording()
        
        // Disable the button until we received notification that the transaction is completed.
        toggleRecogButton?.enabled = false
    }
    
    func cancel() {
        // Cancel the Reco transaction.
        // This will only cancel if we have not received a response from the server yet.
        skTransaction!.cancel()
    }
    
    // MARK: - SKTransactionDelegate
    
    func transactionDidBeginRecording(transaction: SKTransaction!) {
        log("transactionDidBeginRecording")
        
        state = .SKSListening
        startPollingVolume()
        toggleRecogButton?.setTitle("Listening..", forState: .Normal)
    }
    
    func transactionDidFinishRecording(transaction: SKTransaction!) {
        log("transactionDidFinishRecording")
        
        state = .SKSProcessing
        stopPollingVolume()
        toggleRecogButton?.setTitle("Processing..", forState: .Normal)
    }
    
    func transaction(transaction: SKTransaction!, didReceiveRecognition recognition: SKRecognition!) {
        log(String(format: "didReceiveRecognition: %@", arguments: [recognition.text]))
        
        state = .SKSIdle
    }
    
    func transaction(transaction: SKTransaction!, didReceiveServiceResponse response: [NSObject : AnyObject]!) {
        log(String(format: "didReceiveServiceResponse: %@", arguments: [response]))
        
        state = .SKSIdle
        resetTransaction()
    }
    
    func transaction(transaction: SKTransaction!, didReceiveInterpretation interpretation: SKInterpretation!) {
        log(String(format: "didReceiveInterpretation: %@", arguments: [interpretation.result]))
        
        state = .SKSIdle
        resetTransaction()
    }
    
    func transaction(transaction: SKTransaction!, didFinishWithSuggestion suggestion: String) {
        log("didFinishWithSuggestion")
    }
    
    func transaction(transaction: SKTransaction!, didFailWithError error: NSError!, suggestion: String) {
        log(String(format: "didFailWithError: %@. %@", arguments: [error.description, suggestion]))
        
        // Something went wrong. Ensure that your credentials are correct.
        // The user could also be offline, so be sure to handle this case appropriately.
        
        state = .SKSIdle
        resetTransaction()
    }
    
    // MARK: - Other Actions
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = event?.allTouches()?.first
        if (languageTextView!.isFirstResponder() && touch!.view != languageTextView) {
            languageTextView!.resignFirstResponder()
        }
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func selectEndpointerType(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        if(index == 0){
            endpointer! = .Long
        } else if (index == 1){
            endpointer! = .Short
        } else if (index == 2){
            endpointer! = .None
        }
    }
    
    @IBAction func useNLUModel(sender: UITextField) {
        contextTag = sender.text
    }
    
    @IBAction func useLanguage(sender: UITextField) {
        language = sender.text
    }
    
    @IBAction func clearLogs(sender: UIButton) {
        logTextView!.text = ""
    }
    
    // MARK: - Volume level
    
    func startPollingVolume() {
        // Every 50 milliseconds we should update the volume meter in our UI.
        volumePollTimer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(SKSNLUViewController.pollVolume), userInfo: nil, repeats: true)
    }
    
    func pollVolume() {
        let volumeLevel = skTransaction!.audioLevel
        volumeLevelProgressView!.setProgress(volumeLevel / Float(100), animated: true)
    }
    
    func stopPollingVolume() {
        volumePollTimer!.invalidate()
        volumePollTimer = nil
        volumeLevelProgressView!.setProgress(Float(0), animated: true)
    }
    
    //MARK - Helpers
    
    func log(message: String) {
        logTextView!.text = logTextView!.text.stringByAppendingFormat("%@\n", message)
    }
    
    func resetTransaction() {
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.skTransaction = nil
            self.toggleRecogButton?.setTitle("recognizeWithService", forState: .Normal)
            self.toggleRecogButton?.enabled = true
        })
    }
    
    func loadEarcons() {
        let startEarconPath = NSBundle.mainBundle().pathForResource("sk_start", ofType: "pcm")
        let stopEarconPath = NSBundle.mainBundle().pathForResource("sk_stop", ofType: "pcm")
        let errorEarconPath = NSBundle.mainBundle().pathForResource("sk_error", ofType: "pcm")
        let audioFormat = SKPCMFormat()
        audioFormat.sampleFormat = .SignedLinear16
        audioFormat.sampleRate = 16000
        audioFormat.channels = 1
        
        skSession!.startEarcon = SKAudioFile(URL: NSURL(fileURLWithPath: startEarconPath!), pcmFormat: audioFormat)
        skSession!.endEarcon = SKAudioFile(URL: NSURL(fileURLWithPath: stopEarconPath!), pcmFormat: audioFormat)
        skSession!.errorEarcon = SKAudioFile(URL: NSURL(fileURLWithPath: errorEarconPath!), pcmFormat: audioFormat)
    }
    
}