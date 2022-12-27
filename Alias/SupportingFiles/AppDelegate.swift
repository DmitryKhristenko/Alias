//
//  AppDelegate.swift
//  Alias
//
//  Created by ALEKSEY SUSLOV on 26.07.2022.
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try audioSession.setActive(true)
        } catch {
            Logger.shared.debugPrint(error)
        }
        SoundManager.shared.prepare()
        return true
    }
}
