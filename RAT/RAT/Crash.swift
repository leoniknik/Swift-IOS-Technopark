//
//  Crash.swift
//  RAT
//
//  Created by Kirill on 3/29/17.
//  Copyright © 2017 RAT. All rights reserved.
//

import Foundation
import SwiftyJSON

class Crash {
    
    var id: Int?
    var code: String = ""
    var fullDescription: String = ""
    var shortDescription: String = ""
    var date: String = ""
    
    var arrayOffers = Array<Offer>()
    
}
