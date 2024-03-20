//
//  TriviaQuestions.swift
//  Trivia
//
//  Created by Diwakar Kumawat on 3/11/24.
//

import Foundation
import UIKit

struct TriviaQuestions: Decodable {
    let type: String
    let difficulty: String
    let category: String
    let theme: String?
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}



/* "type": "boolean",
 "difficulty": "medium",
 "category": "Mythology",
 "question": "The Roman god &quot;Jupiter&quot; was first known as &quot;Zeus&quot; to the Greeks.",
 "correct_answer": "True",*/
