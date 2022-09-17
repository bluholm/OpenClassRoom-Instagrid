//
//  viewController+pickerDelegate.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-09-12.
//

import UIKit

// MARK: Extension For PickerController
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                return
        }
        buttonTapped.setImage(pickedImage, for: .normal)
        buttonTapped.contentMode = .scaleAspectFit
        dismiss(animated: true, completion: nil)
    }
}
