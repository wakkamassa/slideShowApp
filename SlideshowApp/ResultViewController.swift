//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 　若原　昌史 on 2018/02/17.
//  Copyright © 2018年 WakaharaMasashi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController  {
    @IBOutlet weak var imageView: UIImageView!
    var zoomImage = UIImage()
    override func viewDidLoad() {
        imageView.image = zoomImage
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
