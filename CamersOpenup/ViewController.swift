//
//  ViewController.swift
//  CamersOpenup
//
//  Created by Siva Mouniker  on 20/04/23.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                if response {
                    //access granted
                    print("acess given")
                } else {
                    print("no acess given")
                }
            }
    }

    @IBAction func actionOpenGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func actionOpenCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                present(imagePicker, animated: true, completion: nil)
            }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        let selectedImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView?.image = selectedImage
        picker.dismiss(animated: true,completion: nil)
    }
    
}

