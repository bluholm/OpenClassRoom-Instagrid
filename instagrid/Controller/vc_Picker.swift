//
//  ViewController+Picker.swift
//  Instagrid
//
//  Created by Marc-Antoine BAR on 2022-09-12.
//

import UIKit

extension ViewController {
    @IBAction func pickAPicture(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            return
        }

        buttonTapped = sender
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) ?? []
        assert(!pickerController.mediaTypes.isEmpty)
        pickerController.mediaTypes = ["public.image"]
        pickerController.allowsEditing = false
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
}
