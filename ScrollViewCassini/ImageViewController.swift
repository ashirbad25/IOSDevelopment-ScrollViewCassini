//
//  ImageViewController.swift
//  ScrollViewCassini
//
//  Created by Aashirwad Sinha on 11/4/19.
//  Copyright © 2019 Credit Suisse. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    //var imageView = UIImageView()
    
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil { // We are on screen, then only fetch image
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
}
