//
//  BackgroundMusic.swift
//  Bars
//
//  Created by Swayam Barik on 7/21/16.
//  Copyright © 2016 Swayam Barik. All rights reserved.
//

import Foundation
import AVFoundation

class BackgroundMusic{
    
    static let myFilePathString = NSBundle.mainBundle().pathForResource("Beat1", ofType: "mp3")
    static var player: AVPlayer = AVPlayer()
    //print(myFilePathString)
    
    static func playMusic(){
        if let myFilePathString = myFilePathString{
            let myFilePathURL = NSURL(fileURLWithPath: myFilePathString)
            print(myFilePathURL)
            print(myFilePathString)
            
            do{
                try player = AVPlayer(URL: myFilePathURL)
                
                player.play()
                
            }catch
            {
                print("error")
            }
            
        }
    }
    
}
