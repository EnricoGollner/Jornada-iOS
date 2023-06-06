//
//  ViewController.swift
//  PieceOfTheChallangeTabBar
//
//  Created by Enrico Sousa Gollner on 11/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectImageButton.backgroundColor = .systemIndigo
        selectImageButton.titleLabel?.textColor = .white
        
    }

    @IBAction func tappedSelectImage(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Select Image", message: "Select image from:", preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction(title: "Camera", style: .default) { _ in
            self.showImagePicker(source: .camera)
        }
        let galleryButton = UIAlertAction(title: "Library", style: .default) { _ in
            self.showImagePicker(source: .photoLibrary)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cameraButton)
        alertController.addAction(galleryButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true)
    }
    
    func showImagePicker(source: UIImagePickerController.SourceType) {
        let pickerPhotoController = UIImagePickerController()
        pickerPhotoController.delegate = self
        // pickerPhotoController.allowsEditing = true
        pickerPhotoController.sourceType = source
        
        present(pickerPhotoController, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // guard let pickedImage = info[.editedImage] as? UIImage else { return }  // .editedImage, caso tenhamos setado true: "pickerPhotoController.allowsEditing = true" na configuração UIImagePicekrController - linha 26
        
        guard let pickedImage = info[.originalImage] as? UIImage else { return }
        
        imagePhoto.image = pickedImage
        
        picker.dismiss(animated: true)
    }
    
}
