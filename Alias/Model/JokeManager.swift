//
//  JokeManager.swift
//  Alias
//
//  Created by Вячеслав Терентьев on 29.07.2022.
//

import Foundation

struct JokeManager {
    static let shared = JokeManager()
    private let jokeURL = "https://joke.deno.dev/"
    func fetchJoke(completion: @escaping (JokeData) -> Void) {
        if let url = URL(string: jokeURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if error != nil {
                    Logger.shared.debugPrint(error as Any)
                    return
                }
                if let safeData = data {
                    if let joke = parseJSON(safeData) {
                        DispatchQueue.main.async {
                            completion(joke)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    private func parseJSON(_ jokeData: Data) -> JokeData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JokeData.self, from: jokeData)
            let joke = decodedData
            return joke
        } catch {
            Logger.shared.debugPrint(error)
            return nil
        }
    }
    private init() {}
}
