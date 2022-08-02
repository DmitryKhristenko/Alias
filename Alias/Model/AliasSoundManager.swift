//
//  SoundManager.swift
//  Alias
//
//  Created by Дмитрий Х on 29.07.22.
//

import AVFoundation

struct SoundManager {
    enum SoundType: String {
        case correct = "correct"
        case skip = "skip"
    }
    
    static var shared = SoundManager()
    
    private var player: AVAudioPlayer!
    
    mutating func playSound(for soundType: SoundType) {
        let url = Bundle.main.url(forResource: soundType.rawValue, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    mutating func prepare () {
        let url = Bundle.main.url(forResource: SoundType.skip.rawValue, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.prepareToPlay()
    }
    
    private init() {}
}
