//
//  ViewController.swift
//  Now Or Never 2.0
//
//  Created by Justin Mac on 4/30/16.
//  Copyright © 2016 Justin Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var profileNames = ["Justin", "Ashley", "Amber", "Jennifer", "Ethan", "Michael", "David", "Kristin", "Brandon", "Katie"] //populate test names
    
    var profileImages = [UIImage]()
    var profileBios = [String]()
    //populate with test images
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateImageArray()
        navigationController!.navigationBar.barTintColor = UIColor(colorLiteralRed: 87/255, green: 143/255, blue: 234/255, alpha: 0.1)
        //Status Bar White Font
        navigationController?.navigationBar.barStyle = UIBarStyle.Black
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
    }
    
    func populateImageArray() -> Void {
        for i  in 1 ... 20 {
            profileImages.append(UIImage(named: "a\(i)")!)
            profileNames.append("Justin")
            profileBios.append("Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize { //corrects auto layout, using 2 rows
        return CGSize(width: self.view.bounds.width/2, height: self.view.bounds.height/4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { //required function for UICollectionView
         return profileImages.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! profileImageCell //searches for identifier labeled "cell" from storyboard
        cell.imageView?.image = self.profileImages[indexPath.row] //populate the imageViews from the collectionView cells with the profileImages array
        cell.nameLabel?.text = self.profileNames[indexPath.row] //automatically increments the indexPath like ++i
        
        return cell
    } //reuses cell for all cells in UICollectionView
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showProfile", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showProfile" {
            let backButton = UIBarButtonItem()
            backButton.title = "" //want an empty title, rather than app name near back button
            navigationItem.backBarButtonItem = backButton //recreates bar button with empty title
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()! //get the number of selected items in our collectionView
            let indexPath = indexPaths[0] as NSIndexPath //start at first i
            
            let vc = segue.destinationViewController as! profileViewController
            
            //set the profile view up
            print(profileNames[indexPath.row])
            vc.image = self.profileImages[indexPath.row]
            vc.name = self.profileNames[indexPath.row]
            vc.bio = self.profileBios[indexPath.row]
            //vc.title = self.profileNames[indexPath.row]
        }
    }

}

