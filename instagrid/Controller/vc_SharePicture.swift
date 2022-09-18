//
//  vc_SharePicture.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-09-12.
//

import UIKit

extension ViewController {
    
    func getImageFromView(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        view.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func sharePicture(image: UIImage){
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        
        present(activityController, animated: true)
        activityController.completionWithItemsHandler = { (activityType, completed: Bool,
                                                           returnedItems: [Any]?, error: Error?) in
            
            self.moveView(viewTobeMoved: self.gridView, direction: .moveIn)
            
            if completed{
                reloadButtonImage()
                self.alertMessage("Action done . Thank you !")
            }else{
                self.alertMessage("No Action have been done . try again.")
            }
        }
        
    func reloadButtonImage(){
        let image = UIImage(named: "plus")
        imageButton1.setImage(image, for: .normal)
        imageButton2.setImage(image, for: .normal)
        imageButton3.setImage(image, for: .normal)
        imageButton4.setImage(image, for: .normal)
        }
    }
    
    func alertMessage (_ message: String){
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in}))
        self.present(alertController, animated: true)
    }
}
