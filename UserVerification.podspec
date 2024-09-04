Pod::Spec.new do |s|

    s.name             = "UserVerification"
    s.version          = "1.2.1"
    s.summary          = "SDK for verify User based on document and biometric proof"

    s.description      = <<-DESC
    Please follow the integration document to add this SDK into your application.
                   DESC

    s.homepage         =  "https://github.com/FinioTech/UserVerification-iOS-SDK"
    s.license          =  { :type => "MIT", :file => "LICENSE.md" }
    s.author           =  { "Finiotech" => "zahid@finiotech.com" }
    s.source           =  { :git => "https://github.com/FinioTech/UserVerification-iOS-SDK.git", :tag => s.version.to_s }

    s.ios.framework = 'UserVerification'
    s.platform      = :ios, '13.0'
    s.swift_version = '5.0'
    s.ios.deployment_target  = '13.0'
    s.vendored_frameworks = 'UserVerification.xcframework'
    
    s.frameworks   = "Foundation"
    s.frameworks   = "UIKit"
    s.frameworks   = "AVFoundation"
    s.libraries    = "c++", "z"

    s.dependency 'OpenSSL-Universal', '~> 1.1.2200'

    s.xcconfig = {"HEADER_SEARCH_PATHS" => "$(inherited)"}

    s.pod_target_xcconfig  = {"EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64"}
    s.user_target_xcconfig = {"EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64"}

end

