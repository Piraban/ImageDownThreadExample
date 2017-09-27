//
//  ViewController.swift
//  ImageDownThreadExample
//
//  Created by Mrs.Piraba Nagkeeran on 9/24/17.
//  Copyright © 2017 Mrs.Piraba Nagkeeran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    let strImgURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Square_Dorchester_01.jpg/1600px-Square_Dorchester_01.jpg"
    var url : NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        url = NSURL(string: strImgURL)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func downloadTapped(_ sender: Any) {
      //  let data = NSData(contentsOf: url as URL)
      //  imgView.image = UIImage(data: data as! Data)
        
        URLSession.shared.dataTask(with: (url as URL), completionHandler: {(data, response, error) -> Void in
            if (error == nil && data != nil){
                DispatchQueue.main.async {
                   self.imgView.image = UIImage(data: data!)
                }
            }
        }).resume()
        
    }


}

