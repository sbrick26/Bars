//
//  SKSConfiguration.swift
//  SpeechKitSample
//
//  All Nuance Developers configuration parameters can be set here.
//
//  Copyright (c) 2015 Nuance Communications. All rights reserved.
//

import Foundation
import SpeechKit

var SKSAppKey = "e01ca43daf5c1e353b1e53c42517d438de8393041649f1de20a42b89579a2138b6c5756521949b5cb2ee20d706f50fe478a3e98eecda6c0c7e9896d532b70de8"
var SKSAppId = "NMDPTRIAL_swayambarik_gmail_com20160719165136"
var SKSServerHost = "sslsandbox.nmdp.nuancemobility.net"
var SKSServerPort = "443"

var SKSLanguage = "eng-USA"

var SKSServerUrl = String(format: "nmsps://%@@%@:%@", SKSAppId, SKSServerHost, SKSServerPort)

// Only needed if using NLU/Bolt
var SKSNLUContextTag = "!NLU_CONTEXT_TAG!"


let LANGUAGE = SKSLanguage == "!LANGUAGE!" ? "eng-USA" : SKSLanguage