//
//  CassiniViewController.swift
//  ScrollViewCassini
//
//  Created by Aashirwad Sinha on 11/11/19.
//  Copyright © 2019 Credit Suisse. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                var destination = segue.destination
                if let navController = destination as? UINavigationController {
                    destination = navController.visibleViewController ?? navController
                }
                if let imageVC = destination as? ImageViewController {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }

}

extension UIViewController {
    var contents: UIViewController {
        if let navController = self as? UINavigationController {
            return navController.visibleViewController ?? self
        } else {
            return self
        }
    }
}
