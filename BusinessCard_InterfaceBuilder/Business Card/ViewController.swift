//
//  ViewController.swift
//  Business Card
//
//  Created by Fernando Benavides Rodriguez on 7/13/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageProfile.layer.cornerRadius = imageProfile.bounds.size.height / 2.0
        imageProfile.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

