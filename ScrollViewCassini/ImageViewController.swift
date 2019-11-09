//
//  ImageViewController.swift
//  ScrollViewCassini
//
//  Created by Aashirwad Sinha on 11/4/19.
//  Copyright © 2019 Credit Suisse. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var imageView = UIImageView()
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    var imageURL: URL? {
        didSet {
            image = nil
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
                image = UIImage(data: imageData)
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1
            
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
}
