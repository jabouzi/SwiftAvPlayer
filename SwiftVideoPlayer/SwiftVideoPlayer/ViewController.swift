//
//  ViewController.swift
//  SwiftVideoPlayer
//
//  Created by Prashant on 08/11/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController, AVPlayerViewControllerDelegate {

    
    // url for playing video
    var videoUrl: URL!
    
    
    // action - play local video
    @IBAction func playLocalVideo(_ sender: UIButton) {
        
        // create video url from local resource (i.e video stored within project folder)
        self.videoUrl = Bundle.main.url(forResource: "sample", withExtension: "mov")!
        
        // perform segue
        self.performSegue(withIdentifier: "seguePlayVideo", sender: self)
    }

    // action - play remote video
    @IBAction func playRemoteVideo(_ sender: UIButton) {
        
        // create video url form remote location (i.e. video stored at domain etc.)
        self.videoUrl = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")

        // perform segue
        self.performSegue(withIdentifier: "seguePlayVideo", sender: self)
    }
    
    
    
    
    // MARK: - View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Navigation function

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "seguePlayVideo" {
            
            // get destination view controller
            let destVc = segue.destination as! AVPlayerViewController
            
            // set player
            destVc.player = AVPlayer(url: self.videoUrl)
        }
        
    }
    
    
}

