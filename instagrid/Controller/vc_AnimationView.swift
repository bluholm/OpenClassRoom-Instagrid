//
//  vc_AnimationView.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-09-16.
//

import UIKit

extension ViewController {
    
    func moveView(viewTobeMoved: UIView,direction: Direction) {
        switch direction {
        case .moveOutUp:
            UIView.animate(withDuration: 0.5) {
                viewTobeMoved.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            }
        case .moveOutLeft:
            UIView.animate(withDuration: 0.5) {
                viewTobeMoved.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0 )
            }
        case .moveIn:
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                viewTobeMoved.transform = .identity
                viewTobeMoved.transform = .identity
                viewTobeMoved.transform = .identity
            })
            
        }
    }
    
}
