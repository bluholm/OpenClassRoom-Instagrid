//
//  ViewController.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-08-15.
//

import UIKit

class ViewController: UIViewController {
    enum Direction {
        case moveOutUp, moveOutLeft, moveIn
    }
    var buttonTapped = UIButton()
    @IBOutlet var swipeArrow: UIImageView!
    @IBOutlet var imageButton1: UIButton!
    @IBOutlet var imageButton2: UIButton!
    @IBOutlet var imageButton3: UIButton!
    @IBOutlet var imageButton4: UIButton!
    @IBOutlet var swipeUptoShare: UILabel!
    @IBOutlet var gridView: UIView!
    @IBOutlet var patternButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        moveView(viewTobeMoved: gridView, direction: .moveIn)
        checkOrientation()
    }
    // MARK: - Load Pattern On Click
    @IBAction func tapPatternButton(_ sender: UIButton) {
        deselectPatternButton()
        sender.isSelected = true

        switch sender.tag {
        case 0:
            imageButton1.isHidden = true
            imageButton3.isHidden = false
        case 1:
            imageButton1.isHidden = false
            imageButton3.isHidden = true
        case 2:
            imageButton1.isHidden = false
            imageButton3.isHidden = false
        default:
            break
        }
    }
    
    func deselectPatternButton() {
        for number in 0...patternButton.count-1 {
            patternButton[number].isSelected = false
        }
    }
    
    // MARK: - Orientation LandScape / Portrait
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        checkOrientation()
    }
    
    func checkOrientation() {
        removeGestureRecognizer()
        if UIDevice.current.orientation.isLandscape {
            swipeUptoShare.text = "swipe left to Share"
            swipeArrow.transform = CGAffineTransform(rotationAngle: (-CGFloat.pi/2))
            swipeLeftGestureInLoad()
        } else {
            swipeUptoShare.text = "swipe up to Share"
            swipeArrow.transform = CGAffineTransform(rotationAngle: 0)
            swipeUpGestureInLoad()
        }
    }
}
