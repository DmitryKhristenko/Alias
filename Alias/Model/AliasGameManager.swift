//
//  AliasGameManager.swift
//  Alias
//
//  Created by Дмитрий Х on 28.07.22.
//

struct AliasGameManager {
    var score = 0
    
    private var currentRound = 1
    private var wordIndex = 0
    
    private var words: [String]
    
    mutating func getNextWord() -> String {
        
        let word = words[wordIndex]
        
        if wordIndex < words.count {
            wordIndex += 1
        } else {
            words.shuffle()
            wordIndex = 0
        }
        
        if currentRound % 4 == 0 {
            words.shuffle()
        }
        
        if Int.random(in: 0...100) % 6 == 0 {
            print("ДЕЙСТВИЕ")
        }
        
        return word
    }
    
    mutating func nextRound() {
        currentRound += 1
    }
    
    mutating func scoreUp() {
        score += 1
    }
    
    mutating func scoreDown() {
        score -= 1
    }
}
