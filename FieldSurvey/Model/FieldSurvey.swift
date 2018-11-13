//
//  FieldSurvey.swift
//  FieldSurvey
//
//  Created by Allison Dolan on 11/12/18.
//  Copyright © 2018 Allison Dolan. All rights reserved.
//

import Foundation

enum Classification: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct FieldSurvey: Codable {
    var classification: Classification
    var title: String
    var date: Date
    var description: String
}

struct FieldSurveys: Codable{
    var status: String
    var surveys: [FieldSurvey]
}

