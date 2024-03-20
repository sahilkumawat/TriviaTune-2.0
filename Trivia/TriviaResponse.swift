//
//  TriviaResponse.swift
//  Trivia
//
//  Created by Diwakar Kumawat on 3/20/24.
//

import Foundation

struct TriviaResponse: Decodable {
    let results: [TriviaQuestions]
}
