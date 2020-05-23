//
//  ViewController.swift
//  DogClassifier
//
//  Created by Noman Ikram on 23/05/2020.
//  Copyright © 2020 Noman Ikram. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! // UIImageView to display image chosen from cameraroll
    @IBOutlet weak var breedLabel: UILabel! // UILabel to display the name of the breed
    
    let pickerController = UIImagePickerController()

    var visionModel: VNCoreMLModel?
    var request: VNCoreMLRequest?
    
    let model = Dog_Breeds_Classifier()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial Setup
        settingUpCameraRollPicker()
    }

    // to process the image to identify the breed of dog
    func breedLabel(forImage image:UIImage)->String?{
        if let imageBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!){
            guard let breed = try? model.prediction(image: imageBuffer) else { fatalError("Error") }
            return breed.classLabel
        }
        return nil
    }
    
    // pickup image from cameraroll and process
    @IBAction func chooseImage(_ sender: Any) {
        pickerController.allowsEditing = false
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
}

extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func settingUpCameraRollPicker()  {
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image", "public.movie"]
        pickerController.sourceType = .photoLibrary
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // image picked up from cameraroll
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            // processed and named the breed label of the view
            self.breedLabel.text = breedLabel(forImage: pickedImage)
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
