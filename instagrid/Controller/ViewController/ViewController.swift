//
//  ViewController.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-08-15.
//

import UIKit

class ViewController: UIViewController {

    var buttonTapped = UIButton()
    @IBOutlet private var swipeArrow: UIImageView!
    @IBOutlet var imageButton1: UIButton!
    @IBOutlet var imageButton2: UIButton!
    @IBOutlet var imageButton3: UIButton!
    @IBOutlet var imageButton4: UIButton!
    @IBOutlet private var swipeUpToShare: UILabel!
    @IBOutlet var gridView: UIView!
    @IBOutlet private var patternButton: [UIButton]!
    
    // MARK: - UI View Controller life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animateViewInDirection(viewToBeMoved: gridView, direction: .moveIn)
        checkOrientationAndUpdateViewController()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        checkOrientationAndUpdateViewController()
    }
    
    // MARK: - User actions
    
    @IBAction private func didTapPatternButton(_ sender: UIButton) {
    
        didDeselectPatternButton()
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
    
    // MARK: Custom Logic
    
    private func didDeselectPatternButton() {
        patternButton.forEach{ $0.isSelected = false }
    }

    private func checkOrientationAndUpdateViewController() {
        removeGestureRecognizer()
        if UIDevice.current.orientation.isLandscape {
            swipeUpToShare.text = "swipe left to Share"
            swipeArrow.transform = CGAffineTransform(rotationAngle: (-CGFloat.pi/2))
            addSwipeLeftGestureInLoad()
        } else {
            swipeUpToShare.text = "swipe up to Share"
            swipeArrow.transform = CGAffineTransform(rotationAngle: 0)
            addSwipeUpGestureInLoad()
        }
    }

    enum Direction {
        
        /// navigation from bottom to up like push of navigation view controller
        case moveOutUp
        
        /// navigation from right to left like push of navigation controller
        case moveOutLeft
        
        /// navigation from top to bottom like push of navigation controller
        case moveIn
    }
    
}
