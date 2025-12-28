//
//  TimerManager.swift
//  EggTimer
//
//  Created by Codex on 2025-02-14.
//
import UIKit
import Foundation

final class TimerManager {

    static let shared = TimerManager()

    private var timer: Timer?
    private var remainingSeconds: Int = 0

    private init() {}

    func start(seconds: Int, progressBar: UIProgressView, completion: @escaping () -> Void) {
        self.timer?.invalidate()
        self.remainingSeconds = max(0, seconds)

        guard self.remainingSeconds > 0 else {
            print("0 seconds remaining")
            completion()
            return
        }

        print("\(self.remainingSeconds) seconds remaining")
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            self.remainingSeconds -= 1
            print("\(self.remainingSeconds) seconds remaining")
            progressBar.progress = Float(seconds - self.remainingSeconds) / Float(seconds)

            if self.remainingSeconds <= 0 {
                timer.invalidate()
                completion()
            }
        }
    }
}
