//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 　若原　昌史 on 2018/02/08.
//  Copyright © 2018年 WakaharaMasashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer:Timer!
    var imageNo:Int = 0
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startPauseButton: UIButton!
    var imageListArray:[UIImage]! = [ UIImage(named:"6df1cb779f522db682d5f5875cd2661d.jpg")!,UIImage(named:"images.jpeg")!, UIImage(named:"lebron-james-nba-playoffs-run.jpg")!,UIImage(named:"nba18mobile-intro_hero-xs-2x.jpg")!]
override func viewDidLoad() {
        super.viewDidLoad()
    imageView.image = imageListArray[imageNo]
    
    }
    @IBAction func nextButton(_ sender: Any) {
        if imageNo < 3 {
            imageNo += 1
            imageView.image = imageListArray[imageNo]
        }else if imageNo == 3 {
            imageNo = 0
            imageView.image = imageListArray[imageNo]
        }
    }
    @IBAction func backButton(_ sender: Any) {
        if imageNo > 0 {
            imageNo -= 1
        imageView.image = imageListArray[imageNo]
        }else if imageNo == 0 {
            imageNo = 3
            imageView.image = imageListArray[imageNo]
        }
    }
    
    @IBAction func startPauseButton(_ sender: Any) {
        if startPauseButton.currentTitle == "停止"{
            nextButton.isEnabled = true
            backButton.isEnabled = true
            self.timer.invalidate()
            startPauseButton.setTitle("再生", for: .normal)
        }else if startPauseButton.currentTitle == "再生"{
            nextButton.isEnabled = false
            backButton.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateImageNo), userInfo: nil, repeats: true)
            startPauseButton.setTitle("停止", for: .normal)
        }
    }
    override func prepare(for segue: UIStoryboardSegue , sender :Any?){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.zoomImage = self.imageView.image!
        if self.timer != nil{self.timer.invalidate()
        nextButton.isEnabled = true
        backButton.isEnabled = true
            startPauseButton.setTitle("再生",for: .normal)
        }else if self.timer == nil{
            imageView.image = imageListArray[imageNo]
        }
    }
    @objc func updateImageNo(timer:Timer){
        if imageNo < 3{ self.imageNo += 1
        }else if imageNo == 3{
            imageNo = 0
        }
        imageView.image = imageListArray[imageNo]
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
}

