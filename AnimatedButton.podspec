Pod::Spec.new do |s|
  s.name         = "AnimatedButton"
  s.version      = "1.0.0"
  s.authors      = { 'John Gluszak' => 'john.gluszak@gmail.com' }
  s.summary      = "A UIButton with bounce and fade animations"
  s.homepage     = "https://github.com/johngluszak/animated-ios-button"
  s.license      = { :type => "MIT", :file => "LICENSE"}
  s.requires_arc = true
  s.platform     = :ios, "7.1"
  s.source       = { :git => "https://github.com/johngluszak/animated-ios-button.git", :tag => s.version.to_s }
  s.source_files = "**/*.{h,m}"
end
