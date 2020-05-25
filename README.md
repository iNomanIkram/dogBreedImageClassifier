# CoreML Model: Dog's Breed Classifier

This CoreML Model is trained with the 80+ breeds of dogs and with more 1.8 million images.

### Model is trained with the following breeds
- affenpinscher
- african
- airedale
- airedale
- appenzeller
- basenji
- beagle
- bluetick
- borzoi
- bouvier
- boxer
- brabancon
- briard
- bulldog
- bullterrier
- cairn
- cattle dog
- chihuahua
- chow
- clumber
- cockapoo
- collie
- coonhound
- corgi
- cotondetulear
- dachshund
- dalmatian
- dane
- deerhound
- dhole
- dingo
- doberman
- elkhound
- entlebucher
- eskimo
- frise
- german shepherd
- greyhound
- groenendael
- hound
- husky
- keeshond
- kelpie
- komondor
- kuvasz
- labrador
- leonberg
- lhasa
- malamute
- malinois
- maltese
- mastiff
- mexican hairless
- mix
- mountain
- newfoundland
- otterhound
- papillon
- pekinese
- pembroke
- pinscher
- pointer
- pomeranian
- poodle
- pug
- puggle
- pyrenees
- redbone
- retriever
- ridgeback
- rottweiler
- saluki
- samoyed
- schipperke
- schnauzer
- setter
- sheepdog
- shiba
- shihtzu
- spaniel
- springer
- stbernard
- terrier
- vizsla
- weimaraner
- whippet
- wolfhound

# Test Application
You can either test provided model by using our Example Demo App 

![Demo Application Screenshot](https://github.com/iNomanIkram/dogBreedImageClassifier/blob/master/demo-app.png)


By following our instructions.
* copy **ImageProcessor.swift** in the root folder of your project.
* lets initialize the model
`let model = Dog_Breeds_Classifier()`
* copy this method to process image and return breed name.
``` 
// to process the image to identify the breed of dog
    func breedLabel(forImage image:UIImage)->String?{
        if let imageBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!){
            guard let breed = try? model.prediction(image: imageBuffer) else { fatalError("Error") }
            return breed.classLabel
        }
        return nil
    }
