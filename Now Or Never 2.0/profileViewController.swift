//
//  profileViewController.swift
//  Now Or Never 2.0
//
//  Created by Justin Mac on 4/30/16.
//  Copyright © 2016 Justin Mac. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    @IBOutlet weak var imageView = UIImageView()
    @IBOutlet weak var nameLabel = UILabel()
    @IBOutlet weak var bioView = UITextView()
    
    var image = UIImage()
    var name = String()
    var bio = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.imageView?.image = self.image
        self.nameLabel?.text = self.name
        self.bioView?.text = self.bio
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
