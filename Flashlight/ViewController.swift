//
//  ViewController.swift
//  Flashlight
//
//  Created by Michael Duong on 1/15/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var tapGesture: UITapGestureRecognizer!
    
    var isOn: Bool = false
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        if isOn {
            isOn = false
            view.backgroundColor = UIColor.black
            button.setTitleColor(UIColor.white, for: .normal)
            button.setTitle("ON", for: .normal)
            UIApplication.shared.statusBarStyle = .lightContent
            toggleTorch(on: false)
        }
        
        else {
            isOn = true
            view.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitle("OFF", for: .normal)
            UIApplication.shared.statusBarStyle = .default
            toggleTorch(on: true)

        }
    }
    
    @IBAction func screenTapped(_ sender: Any) {
        if isOn {
            isOn = false
            view.backgroundColor = UIColor.black
            button.setTitleColor(UIColor.white, for: .normal)
            button.setTitle("ON", for: .normal)
            UIApplication.shared.statusBarStyle = .lightContent
            toggleTorch(on: false)
        }
            
        else {
            isOn = true
            view.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitle("OFF", for: .normal)
            UIApplication.shared.statusBarStyle = .default
            toggleTorch(on: true)
        }
    }
}




