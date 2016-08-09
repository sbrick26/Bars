//
//  GlobalVariable.swift
//  Bars
//
//  Created by Swayam Barik on 7/28/16.
//  Copyright © 2016 Swayam Barik. All rights reserved.
//

import Foundation

var rhymeAPIArray: [WordAPI] = []
var solidRhymes: [WordAPI] = []
var found = false

var myText:String!
var wordUni: String = ""

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


//
//    var inputword = "time"
//
//    var outputArray
//    var newArray
//
//    for object in outpuArray{
//        var size = inputword.charactercount()
//        if size > object.word.charactersize(){
//            if !object.word.charactersFromEnd(size).stringEaquels(inputword){
//            newArray.add(word)
//        }
//    }
//
//    print(newArray)
