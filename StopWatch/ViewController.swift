//
//  ViewController.swift
//  StopWatch
//
//  Created by Lightwing Ng on 2018/6/6.
//  Copyright © 2018 Lightwing Ng. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!

    var counter = 0.00
    var timer = Timer()
    var isPlaying = false

    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(counter)
    }

    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func resetButtonDidTouch(_ sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }

    @IBAction func playButtonDidTouch(_ sender: UIButton) {
        if (isPlaying) {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        // 秒针时差
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(ViewController.UpdateTimer),
            userInfo: nil,
            repeats: true
        )
        isPlaying = true
    }

    @IBAction func pauseButtonDidTouch(_ sender: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false

    }

    @objc func UpdateTimer() {
        counter += 0.01
        timeLabel.text = String(format: "%.2f", counter)
    }
}

