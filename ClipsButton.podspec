Pod::Spec.new do |s|

  s.name         = "ClipsButton"
  s.version      = "1.00"
  s.summary      = "A Button insipraed by Apple Clips"
  s.description  = "The ClipsButton is a completely customizable widget that can be used in any iOS app.It looks like Record Button in Apple Clips"
  s.homepage     = "https://github.com/sishenyihuba/ClipsButton"
  s.license      = "MIT"
  s.author       = { "DXL" => "sishenyihubaba@gmail.com" }
  s.social_media_url = "http://www.jianshu.com/u/395eedc160ca"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/sishenyihuba/ClipsButton.git", :tag => "1.0.0" }
  s.source_files = "ClipsButton", "ClipsButton/**/*.swift"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }
end
