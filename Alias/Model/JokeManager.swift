//
//  JokeManager.swift
//  Alias
//
//  Created by Вячеслав Терентьев on 28.07.2022.
//

import Foundation

protocol JokeManagerDelegate {
    
    func didUpdateJoke(_ jokeSetup: JokeManager, jokePunchline: JokeData)
    func didFailWithError(error: Error)
}

struct JokeManager {
    
    private let jokeURL = "https://joke.deno.dev"
    
    var delegate: JokeManagerDelegate?
        
    func getJoke() {
        
        if let url = URL(string: jokeURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let joke = parseJSON(safeData) {
                        delegate?.didUpdateJoke(self, jokePunchline: joke)

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
            let jokeSetup = decodedData.setup
            let punchLine = decodedData.punchline
            
            let joke = JokeData(setup: jokeSetup, punchline: punchLine)
            return joke
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
