//
//  ViewController.swift
//  Flashtrend
//
//  Created by shahid mohd on 13/10/18.
//  Copyright © 2018 shahidmohd. All rights reserved.
//

import UIKit
import SwiftyCam

class ViewController: SwiftyCamViewController,SwiftyCamViewControllerDelegate {

    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var recordButton: SwiftyCamButton!
       @IBOutlet weak var flashButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let frame = CGRect(x: 0, y: 10, width: 200, height: 200)
//        let captureButton = SwiftyCamButton(frame: frame)
        recordButton.delegate = self
        cameraDelegate = self
        defaultCamera = .front
        doubleTapCameraSwitch = true
        videoQuality = .high
//        switchCamera()
        
        maximumVideoDuration = 10.0
        pinchToZoom = true
        tapToFocus = true
        allowBackgroundAudio = true
        lowLightBoost = true

    




        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func qualityChanged(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            videoQuality = .low
//            VideoQuality.low
        case 1:
//             VideoQuality.medium
            videoQuality = .medium
            
        default:
            videoQuality = .high
//            VideoQuality.high
            
        }
        
    }
    
    @IBAction func toggleFlashTapped(_ sender: Any) {
        flashEnabled = !flashEnabled
        
        if flashEnabled == true {
            flashButton.setImage(#imageLiteral(resourceName: "flashOn1"), for: UIControlState())        } else {
            flashButton.setImage(#imageLiteral(resourceName: "noflash2"), for: UIControlState())
        }
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        let newVC = PhotoViewController(image: photo)
        self.present(newVC, animated: true, completion: nil)
        // Called when takePhoto() is called or if a SwiftyCamButton initiates a tap gesture
        // Returns a UIImage captured from the current session
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didBeginRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
        
        recordButton.alpha = 0.5
//        UIView.animate(withDuration: 0.25, animations: {
//            self.flashButton.alpha = 0.0
//            self.flipCameraButton.alpha = 0.0
//        })
        // Called when startVideoRecording() is called
        // Called if a SwiftyCamButton begins a long press gesture
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
        recordButton.alpha = 1.0
        
        // Called when stopVideoRecording() is called
        // Called if a SwiftyCamButton ends a long press gesture
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
        
        let newVC = VideoViewController(videoURL: url)
        self.present(newVC, animated: true, completion: nil)
        // Called when stopVideoRecording() is called and the video is finished processing
        // Returns a URL in the temporary directory where video is stored
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFocusAtPoint point: CGPoint) {
        // Called when a user initiates a tap gesture on the preview layer
        // Will only be called if tapToFocus = true
        // Returns a CGPoint of the tap location on the preview layer
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didChangeZoomLevel zoom: CGFloat) {
        // Called when a user initiates a pinch gesture on the preview layer
        // Will only be called if pinchToZoomn = true
        // Returns a CGFloat of the current zoom level
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didSwitchCameras camera: SwiftyCamViewController.CameraSelection) {
        // Called when user switches between cameras
        // Returns current camera selection
    }


}

