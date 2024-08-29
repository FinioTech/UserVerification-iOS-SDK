# UserVerification iOS SDK

 [![Platform](https://img.shields.io/cocoapods/p/UserVerification?style=flat&color=red)](https://cocoapods.org/pods/UserVerification)
 [![Version](https://img.shields.io/cocoapods/v/UserVerification?style=flat&color=blue)](https://cocoapods.org/pods/UserVerification) 
 [![Swift Versions](https://img.shields.io/badge/Swift-5.6_5.7_5.8-orange?style=flat&color=orange)](https://cocoapods.org/pods/UserVerification)
 [![License](https://img.shields.io/github/license/FinioTech/UserVerification-iOS-SDK?style=flat&color=green)](https://cocoapods.org/pods/UserVerification)

 ## Features
 - [Document verification](#document-verification)
 - [Face verification](#face-verification)
 - [NFC verification](#nfc-verification)

## Requirements

- iOS 13.0+
- Xcode 14.3+

## Setup 

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. 
To integrate `UserVerification` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'UserVerification'
```


## Usage

### Initialization

Import `UserVerification` in your project

```swift
import UserVerification
```

In AppDelegate `didFinishLaunchingWithOptions` method initialize `UserVerification`. Provide your `STORE_ID`, `STORE_PASSWORD` 
& toggle `Sandbox/Production` using a bool.


```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        UserVerification.shared.config(storeId: 'STORE_ID', storePassword: 'STORE_PASSWORD', production: true/false)
        
        return true
    }
```


### Document verification

To verify a Document start camera session, in `viewWillAppear` override method. Provide a `UIView` reference as camera preview, 
pick a `Country` from available options, document flip delay time in `Double`, a boolean (true/false) to enable manual process
and implement `IdVerificationDelegate` delegate to get result. [Stop camera](#stop-camera-session) session before moving forward 
unless memory leak may happen as camera lifecycle didn't finish.

```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserVerification.shared.scanID(preview: self.preview, country: Country, flipIntervalTime: Double, delegate: self)
        UserVerification.shared.startSession()
    }
```

In `IdVerificationDelegate` document verification result will be found.

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


### Face Verification

To continue Face verification start camera session in `viewWillAppear` override method. Provide a `UIView` reference as camera preview, 
pass `userId` from document verification result and implement `UserVerificationDelegate` delegate to get final result. 
[Stop camera](#stop-camera-session) session before moving forward unless memory leak may happen as camera lifecycle didn't finish.


```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserVerification.shared.verifyUser(preview: self.preview, userId: self.userId, delegate: self)
        UserVerification.shared.startSession()
    }
```

In `UserVerificationDelegate` face verification result will be found.

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


### Stop Camera Session

Stop camera session in `viewWillDisappear` override method to safely complete verification process.


```swift
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UserVerification.shared.stopSession()
    }
```


### NFC Verification

To verify a Document start NFC session, in `viewWillAppear` override method. Provide `userId` from document verification result and implement `NFCDataVerificationDelegate` delegate to get final result. [Stop NFC](#stop-nfc-session) session before moving forward, to safely complete verification process.


```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserVerification.shared.verifyNFCData(userId: self.userId, delegate: self)
    }
```

In `NFCDataVerificationDelegate` NFC verification result will be found.

```swift
extension My_ViewController: NFCDataVerificationDelegate {
    
    func onPrepare() {
      // Prepareing to scan NFC chip
    }
    
    func onStart() {
      // NFC scanner prompt will be apeared
    }
    
    func onSuccess() {
      // NFC verification succeed
    }
    
    func onFailure(code: Int, error: String) {
      // NFC verification failed with code and an error message
    }
    
    func onValidCapture(data: NFCTagDataModel) {
      // On successfull scan, NFC response will be returned
    }
}
```


### Stop NFC Session

Stop NFC session in `viewWillDisappear` override method to safely complete verification process.


```swift
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UserVerification.shared.stopSession()
    }
