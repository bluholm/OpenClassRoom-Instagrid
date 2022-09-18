//
//  vc_SwipeGesture.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-09-12.
//

import UIKit

extension ViewController {
    
    func swipeGestureInLoad() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipedUp))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
    }
    
    @objc func swipedUp() {
        guard let picture = getImageFromView(view: gridView) else { return}
        sharePicture(image: picture)
        moveView(viewTobeMoved: gridView, direction: .moveOut)
        
    }
   
    
}
