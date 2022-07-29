//
//  SoundManager.swift
//  Alias
//
//  Created by Дмитрий Х on 29.07.22.
//

import AVFoundation

class AliasSoundManager {
    static let sharedInstance = AliasSoundManager()
    var player: AVAudioPlayer!
    
    private init() {
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
