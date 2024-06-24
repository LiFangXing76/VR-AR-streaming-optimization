//
//  ViewController.swift
//  GStreamerSwift
//
//  Created by Qasem Zraiq on 4/11/24.
//

import UIKit

class ViewController: UIViewController {
    var uri = "" // RTSP stream URL
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    var username: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.startAnimating()
        
        // Construct RTSP stream URL
        uri = "rtsp://\(username!):\(password!)@rtsp-test.vipr.cloud:8554/virtual"
        
        let videoViewController = GStreamerVideoViewController()
        videoViewController.changeURI(uri)
        
        // Add GStreamer video view to the main view
        videoView.addSubview(videoViewController.view)
        
        // Configure auto layout constraints for the video view
        videoViewController.view.translatesAutoresizingMaskIntoConstraints = false
        videoViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        videoViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        videoViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        videoViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        // Stop loader after 5 seconds (for simulation purposes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.loader.stopAnimating()
            self.loader.isHidden = true
        }
    }
}
