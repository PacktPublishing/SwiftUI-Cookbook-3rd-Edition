//
//  SurveyEntry.swift
//  SwiftChartsBasics
//
//  Created by Juan Catalan on 9/14/23.
//

import Foundation
import Charts

enum Question: String {
    case first
    case second
    case third
}

enum Answer: String {
    case yes
    case no
    case maybe
    case declined
}

struct SurveyEntry: Identifiable {
    var id = UUID()
    var question: Question
    var answer: Answer
    var count: Int
}

extension SurveyEntry {
    static let sampleSurvey: [SurveyEntry] = [
        .init(question: .first, answer: .yes, count: 12),
        .init(question: .first, answer: .no, count: 7),
        .init(question: .first, answer: .maybe, count: 5),
        .init(question: .first, answer: .declined, count: 1),
        .init(question: .second, answer: .yes, count: 7),
        .init(question: .second, answer: .no, count: 4),
        .init(question: .second, answer: .maybe, count: 9),
        .init(question: .second, answer: .declined, count: 0),
        .init(question: .third, answer: .yes, count: 4),
        .init(question: .third, answer: .no, count: 8),
        .init(question: .third, answer: .maybe, count: 0),
        .init(question: .third, answer: .declined, count: 3)
    ]
}
