//
//  ExpandViewController.swift
//  SlideshowApp
//
//  Created by yohei on 2020/12/11.
//  Copyright © 2020 yohei.inokuchi. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var imageArray:[UIImage] = [UIImage(named: "01.jpg")!, UIImage(named: "02.jpg")!, UIImage(named: "03.jpg")!]
    var ExpandNum:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = imageArray[ExpandNum]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
