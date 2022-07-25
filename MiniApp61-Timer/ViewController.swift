//
//  ViewController.swift
//  MiniApp61-Timer
//
//  Created by 前田航汰 on 2022/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var minuetsLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!

    private var timer = Timer()
    private var timeCount = 0

    @IBAction private func didTapStartButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }

    @IBAction private func didTapStopButton(_ sender: Any) {
        timer.invalidate()
    }

    @IBAction private func didTapResetButton(_ sender: Any) {
        timer.invalidate()
        timeCount = 0
        secondLabel.text = "0"
        minuetsLabel.text = "0"
    }

    @objc func Action() {
        let aaa = Int.random(in: 1..<3)
        timeCount += aaa

        if (23 <= timeCount%60) && (timeCount%60 <= 24) {
            timeCount -= 15
        }
        if (40 <= timeCount%60) && (timeCount%60 <= 41) {
            timeCount -= 35
        }

        if timeCount%60 == 59 {
            timeCount -= 10
        }

        secondLabel.text = String(timeCount%60)
        minuetsLabel.text = String(timeCount/60)
    }

}
