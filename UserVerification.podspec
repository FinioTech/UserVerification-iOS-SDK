Pod::Spec.new do |s|
    s.name             = "UserVerification"
    s.version          = "1.0.7"
    s.summary          = "SDK for verify User based on document and biometric proof"

    s.description      = <<-DESC
    Please follow the integration document to add this SDK into your application.
                   DESC

    s.homepage         =  "https://github.com/FinioTech/UserVerification-iOS-SDK"
    s.license          =  { :type => "MIT", :file => 'LICENSE.md }
    s.author           =  { "Finiotech" => "zahid@finiotech.com" }
    s.source           =  { :git => "https://github.com/FinioTech/UserVerification-iOS-SDK.git", :tag => s.version.to_s }

    s.module_name   = "UserVerification"
    s.platform      = :ios
    s.ios.deployment_target = "12.0"
    s.swift_version = "5.0"
    s.ios.vendored_frameworks = "UserVerification.xcframework"
    
    s.frameworks   = "Foundation"
    s.frameworks   = "UIKit"
    s.frameworks   = "AVFoundation"
    s.libraries    = "c++", "z"

    s.dependency "GoogleMLKit/ObjectDetection", "3.2.0"
    s.dependency "GoogleMLKit/FaceDetection", "3.2.0"
    s.dependency "GoogleMLKit/TextRecognition", "3.2.0"

    s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(inherited)" }

end

