//
//  CalendarManager.swift
//  SwiftBrigde
//
//  Created by Tiago Missão on 28/11/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

import Foundation

@objc(DemoManager)
class DemoManager: NSObject {
  
  var bridge: RCTBridge!
  
  private let COUNTDOWN_EVENT = "COUNTDOWN"
  private var randomNumber: UInt32 = 0
  private var lastRandomNumber: UInt32 = 0
  
  
  /// Exports Swift Contants to React.js
  @objc func constantsToExport() -> NSObject {
    return ["COUNTDOWN_EVENT": COUNTDOWN_EVENT] as NSObject
  }
  
  
  /// Receives params from React.js
  @objc func log(_ message: String, time: NSNumber) -> Void {
    print("Logging Message. message: \(message), time: \(time)")
  }
  
  
  /// Receives params from React.js and executes a callback on React.js when finished
  @objc func random(_ max: NSNumber, callback: (NSObject) -> ()) -> Void {
    let randomNum:UInt32 = arc4random_uniform(UInt32(max))
    self.lastRandomNumber = self.randomNumber
    self.randomNumber = randomNum
    callback([[
      "number" : randomNum,
      "min" : 0,
      "max" : max
    ]] as NSObject)
  }
  
  /// Receives params from React.js and executes a callback on React.js when finished
  @objc func isEven(_ number: NSNumber, success: (NSObject) -> (), failure: (NSObject) -> ()) {
    if Int(number) % 2 == 0 {
      success([[]] as NSObject)
      return
    }
    
    failure([[]] as NSObject)
  }
  
  
  /// Receives params from React.js and sends events to React.js
  @objc func countdown(_ start: NSNumber) {
    let n = Int(start)
    for i in (0...n).reversed() {
      self.bridge.eventDispatcher().sendAppEvent(withName: COUNTDOWN_EVENT, body: ["value": i] )
    }
  }
  
  @objc func getLastRandomNumber(_ resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    resolve(self.lastRandomNumber)
  }
}
