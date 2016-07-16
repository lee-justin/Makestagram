//
//  TimelineViewController.swift
//  Makestagram
//
//  Created by King Justin on 7/15/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

// MARK: - Tab Bar Delegate

extension TimelineViewController: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if (viewController is PhotoViewController) {
            print("Take photo")
            takePhoto()
            return false
        } else {
            print("Do nothing since photo tab is not pressed")
            return true
        }
    }
}

class TimelineViewController: UIViewController {
    
    var photoTakingHelper: PhotoTakingHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func takePhoto() {
        // Create an instance of PhotoTakingHelper by assigning it to a variable.
        // Pass in the tabBarController and a closure aka function without a name
        // When PhotoTakingHelper receives an image, it will call the closure, this is why we implement upload image in the closure
        photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!) {(image: UIImage?) in
            print("Received a callback")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


