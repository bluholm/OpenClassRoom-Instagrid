//
//  ViewController.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-08-15.
//

import UIKit


class ViewController: UIViewController {

    var buttonTapped = UIButton()
    
    @IBOutlet var imageButton1: UIButton!
    @IBOutlet var imageButton2: UIButton!
    @IBOutlet var imageButton3: UIButton!
    @IBOutlet var imageButton4: UIButton!
    @IBOutlet var swipeUptoShare: UILabel!
    @IBOutlet var gridView: UIView!
    @IBOutlet var patternButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeGestureInLoad()
        
        
    }
    
    
    
    
    
    // MARK: - Load Pattern On Click
    
    @IBAction func tapPatternButton(_ sender: UIButton) {
        
        deselectPatternButton()
        
        sender.isSelected = true

        switch sender.tag{
        case 0 :
            imageButton1.isHidden = true
            imageButton3.isHidden = false
        case 1 :
            imageButton1.isHidden = false
            imageButton3.isHidden = true
        case 2 :
            imageButton1.isHidden = false
            imageButton3.isHidden = false
        default :
            break
        }
    }
    
    func deselectPatternButton (){
        for number in 0...patternButton.count-1 {
            patternButton[number].isSelected = false
        }
    }
    

}
