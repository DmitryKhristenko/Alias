//
//  AliasGameManager.swift
//  Alias
//
//  Created by Дмитрий Х on 28.07.22.
//

struct AliasGameManager {
    enum ActionWord: Word {
        case action = "ДЕЙСТВИЕ"
    }
    var isOn = false
    var score: String {
        return String(currentScore)
    }
    var round: String {
        return String(currentRound)
    }
    private var currentScore = 0 {
        didSet {
            if currentScore < 0 {
                currentScore = 0
            }
        }
    }
    private let startPhrase = """
    Нажми
    "Начать игру"
    когда будешь готов
    """
    private var currentRound = 0 {
        didSet {
            if currentRound % 4 == 0 {
                words.shuffle()
                print("Shuffled")
            }
        }
    }
    private var wordIndex = 0
    private var words: [String]
    mutating func getWord() -> String {
        var word = startPhrase
        if isOn {
            word = words[wordIndex]
            if wordIndex == words.count - 1 {
                words.shuffle()
                wordIndex = 0
            }
        }
        return word
    }
    mutating func nextRound() {
        currentRound += 1
        currentScore = 0
    }
    mutating func scoreUp() {
        if words[wordIndex] == ActionWord.action.rawValue {
            currentScore += 3
        } else {
            currentScore += 1
        }
        wordIndex += 1
    }
    mutating func scoreDown() {
        if words[wordIndex] == ActionWord.action.rawValue {
            currentScore -= 3
        } else {
            currentScore -= 1
        }
        wordIndex += 1
    }
    static func getManagerWith(_ aliasWordsPack: AliasWordsPack) -> AliasGameManager {
        var words = aliasWordsPack.words
        // Слова ДЕЙСТВИЕ будет в 15 раз меньше чем остальных слов
        let actionWordQTY = words.count / 15
        for _ in 0...actionWordQTY {
            words.append(ActionWord.action.rawValue)
        }
        let aliasGameManager = AliasGameManager(words: words.shuffled())
        return aliasGameManager
    }
}
