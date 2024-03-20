//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Diwakar Kumawat on 3/20/24.
//

import Foundation

class TriviaQuestionService {
    static func getTriviaQuestions(completion: @escaping ([TriviaQuestions]?, Error?) -> Void) {
        let url = URL(string: "https://opentdb.com/api.php?amount=5")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                    print("Error: \(error!.localizedDescription)")
                    completion(nil, error)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("Invalid response")
                    completion(nil, nil)
                    return
                }

                guard let data = data else {
                    print("No data received")
                    completion(nil, nil)
                    return
                }

                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON: \(jsonString)")
                }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(TriviaResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(response.results, nil)
                }
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil, error)
            }

        }
        task.resume()
    }
}
