//
//  WordAPI.swift
//  Bars
//
//  Created by Swayam Barik on 7/27/16.
//  Copyright © 2016 Swayam Barik. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WordAPI {
    let word: String
    let score: Int
    
    init()
    {
        self.word = ""
        self.score = 0
    }
    
    init(json: JSON) {
        
        self.word = json["word"].stringValue
        self.score = json["score"].intValue
    }
}