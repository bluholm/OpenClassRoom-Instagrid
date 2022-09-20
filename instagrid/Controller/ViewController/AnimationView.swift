//
//  vc_AnimationView.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-09-16.
//

import UIKit

extension ViewController {
    
    ///Animiate a view with direction argument
    func animateViewInDirection(viewToBeMoved: UIView, direction: Direction) {
        switch direction {
        case .moveOutUp:
            UIView.animate(withDuration: 0.5) {
                viewToBeMoved.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            }
        case .moveOutLeft:
            UIView.animate(withDuration: 0.5) {
                viewToBeMoved.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0 )
            }
        case .moveIn:
            UIView.animate(withDuration: 0.4, delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: [], animations: {
                viewToBeMoved.transform = .identity
            })
        }
    }
}
