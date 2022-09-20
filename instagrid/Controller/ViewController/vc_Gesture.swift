//
//  vc_SwipeGesture.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-09-12.
//

import UIKit

extension ViewController {
    
    func addSwipeUpGestureInLoad() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipedUp))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func addSwipeLeftGestureInLoad() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipedUp() {
        guard let picture = getImageFromView(view: gridView) else { return}
        sharePicture(image: picture)
        animateViewInDirection(viewToBeMoved: gridView, direction: .moveOutUp)
    }
    
    @objc func swipedLeft() {
        guard let picture = getImageFromView(view: gridView) else { return}
        sharePicture(image: picture)
        animateViewInDirection(viewToBeMoved: gridView, direction: .moveOutLeft)
    }
    
    func removeGestureRecognizer() {
        self.view.gestureRecognizers?.forEach {
            self.view.removeGestureRecognizer($0)
        }
    }
}
