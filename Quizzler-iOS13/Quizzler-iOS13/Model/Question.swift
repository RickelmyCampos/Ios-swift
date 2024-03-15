//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mrpay on 14/02/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


struct Question{
    let text:String
    let answer:String
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
