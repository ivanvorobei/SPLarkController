Pod::Spec.new do |s|

  s.name          = "SPLarkController"
  s.version       = "1.0.5"
  s.summary       = "Modal controller with custom transition"
  s.homepage      = "https://github.com/IvanVorobei/SPLarkController"
  s.source        = { :git => "https://github.com/IvanVorobei/SPLarkController.git", :tag => s.version }
  s.license       = { :type => "MIT", :file => "LICENSE" }
  
  s.author        = { "Ivan Vorobei" => "hello@ivanvorobei.by" }
  
  s.platform      = :ios
  s.ios.framework = 'UIKit'
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "10.0"

  s.source_files  = "Source/SPLarkController/**/*.swift"
  
end


