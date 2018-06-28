//
//  Settings.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-28.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation

class Settings {
    
    var readerModeEnabled: Bool
    
    private init(readerModeEnabled: Bool = false) {
        self.readerModeEnabled = readerModeEnabled
    }
    
    // Singleton
    class var sharedInstance: Settings {
        struct Static {
            static let instance = Settings()
        }
        
        return Static.instance
    }
    
}
