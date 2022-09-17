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
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) ?? []
        assert(!vc.mediaTypes.isEmpty)
        vc.mediaTypes = ["public.image"]
        vc.allowsEditing = false
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}
