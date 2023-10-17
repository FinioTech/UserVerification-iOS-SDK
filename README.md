# UserVerification iOS SDK

 [![Platform](https://img.shields.io/cocoapods/p/UserVerification?style=flat&color=red)](https://cocoapods.org/pods/UserVerification)
 [![Version](https://img.shields.io/cocoapods/v/UserVerification?style=flat&color=blue)](https://cocoapods.org/pods/UserVerification) 
 [![Swift Versions](https://img.shields.io/badge/Swift-5.6_5.7_5.8-orange?style=flat&color=orange)](https://cocoapods.org/pods/UserVerification)
 [![License](https://img.shields.io/cocoapods/l/UserVerification?style=flat&color=green)](https://cocoapods.org/pods/UserVerification)

## Features

- 
- 
- 
- 
- 

## Requirements

- iOS 12.0+
- Xcode 14.3+

## Setup 

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `UserVerification` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'UserVerification'
```

## Usage

#### Initialization

Import `UserVerification` in your project

```swift
import UserVerification
```

In AppDelegate didFinishLaunchingWithOptions method initialize UserVerification


```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        UserVerification.shared.config(storeId: 'STORE_ID', storePassword: 'STORE_PASSWORD', production: true/false)

        return true
    }
```


```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserVerification.shared.scanID(preview: self.mView.scannerUIView, countryCode: countryCode, documentType: docType, flipIntervalTime: 3.0, delegate: self)
        UserVerification.shared.startSession()
    }
```


```swift
extension My_ViewController: IdVerificationDelegate {
    
    func onStart() {
     // Session started
    }
    
    func onCardFlip() {
     // Document flip instruction to scan back side
    }
    
    func onSuccess(userId: String) {
      // Document verification succeed, a 'userid' will be returned 
    }
    
    func onFailure(code: Int, error: String) {
      // Document verification failed with code and an error message
    }
    
    func onValidCapture(image: UIImage, isFront: Bool) {
      // On successfull document capture, an image will return for front/back side
    }
    
}
```


```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserVerification.shared.verifyUser(preview: self.mView.scannerUIView, userId: scannedUserId, delegate: self)
        UserVerification.shared.startSession()
    }
```


```swift
extension My_ViewController: UserVerificationDelegate{
    func onStart() {
      // Session started
    }

    func onInstruction(faceAngle: FaceAngle) {
      // Face movement instruction (Left/Right/Center)
    }

    func onSuccess() {
      // Face verification succeed
    }

    func onFailure(code: Int, error: String) {
      // Face verification failed with code and an error message
    }
    
    func onValidCapture(image: UIImage, faceAngle: FaceAngle) {
      // On successfull face capture, an image will return for perpective angle movement
    }
}
```


```swift
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UserVerification.shared.stopSession()
    }
```


