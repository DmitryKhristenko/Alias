//
//  JokeManager.swift
//  Alias
//
//  Created by Вячеслав Терентьев on 28.07.2022.
//

import Foundation

struct JokeManager {
    
    private let jokeURL = "https://joke.deno.dev"
        
    func getJoke() {
        
        if let url = URL(string: jokeURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJSON(jokeData: safeData)
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(jokeData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JokeData.self, from: jokeData)
            let jokeSetup = decodedData.setup
            let punchLine = decodedData.punchline
            print(jokeSetup, punchLine)
        } catch {
            print(error)
        }
    }
}
