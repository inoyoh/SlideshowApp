//
//  ViewController.swift
//  SlideshowApp
//
//  Created by yohei on 2020/12/10.
//  Copyright © 2020 yohei.inokuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    
    var imageArray:[UIImage] = [UIImage(named: "01.jpg")!, UIImage(named: "02.jpg")!, UIImage(named: "03.jpg")!]
    
    // タイマー
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: "01.jpg")
    }

    
    var slideNum = 0
    
    // 進むボタン
    @IBAction func nextButton(_ sender: Any) {
        slideNum += 1
        if (slideNum == 3){
            slideNum = 0
            imageView.image = imageArray[slideNum]
        } else {
            imageView.image = imageArray[slideNum]
        }
    }
    
    // 戻るボタン
    @IBAction func backButton(_ sender: Any) {
        slideNum -= 1
        if (slideNum == -1){
            slideNum = 2
            imageView.image = imageArray[slideNum]
        } else {
            imageView.image = imageArray[slideNum]
        }
    }
    
    // タイマーが再生中か停止中か判断するためのプロパティ
    var playJudge = 0
    // 再生｜停止ボタン
    @IBAction func actionButton(_ sender: Any) {
        if playJudge == 0 {
            // 表示を変える（再生→停止）
            actionButton.setTitle("停止", for: .normal)
        
            // タイマーを生成して動作させる
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            playJudge += 1
            
            nextButton.isEnabled = false
            backButton.isEnabled = false
        } else if playJudge == 1 {
            // 表示を変える（停止→再生）
            actionButton.setTitle("再生", for: .normal)
            
            // タイマーを停止して破棄する
            self.timer.invalidate()
            
            playJudge -= 1
            
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        slideNum += 1
        if (slideNum == 3){
            slideNum = 0
            imageView.image = imageArray[slideNum]
        } else {
            imageView.image = imageArray[slideNum]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のExpandViewControllerを取得する
        let expandViewController:ExpandViewController = segue.destination as! ExpandViewController

        // 遷移先のExpandViewControllerで宣言しているExpandNumに値を代入して渡す
        expandViewController.ExpandNum = slideNum
        
        
        // 表示を変える（停止→再生）
        actionButton.setTitle("再生", for: .normal)
        
        // タイマーを停止して破棄する
        self.timer.invalidate()

        playJudge = 0

        nextButton.isEnabled = true
        backButton.isEnabled = true
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

