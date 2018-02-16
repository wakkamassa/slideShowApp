//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 　若原　昌史 on 2018/02/08.
//  Copyright © 2018年 WakaharaMasashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
            imageView.image = imageListArray[0]
        }
    }
    @IBAction func backButton(_ sender: Any) {
        if imageNo > 0 {
            imageNo -= 1
        imageView.image = imageListArray[imageNo]
        }else if imageNo == 0 {
            imageView.image = imageListArray[3]
        }
    }
    
    @IBAction func startPauseButton(_ sender: Any) {
        imageView.animationImages = imageListArray
        imageView.animationDuration = 8
        imageView.animationRepeatCount = 0
        if startPauseButton.currentTitle == "停止"{
            nextButton.isEnabled = true
            backButton.isEnabled = true
            imageView.stopAnimating()
            startPauseButton.setTitle("再生", for: .normal)
        }else if startPauseButton.currentTitle == "再生"{
            nextButton.isEnabled = false
            backButton.isEnabled = false
            imageView.startAnimating()
            startPauseButton.setTitle("停止", for: .normal)
        }
    }
    override func prepare(for segue: UIStoryboardSegue , sender :Any?){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.zoomImage = self.imageView.image!
        
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
}

