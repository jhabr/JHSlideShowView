Pod::Spec.new do |s|
  s.name         = "JHSlideShowView"
  s.version      = "1.0.0"
  s.summary      = "A customizable slideshow view for iOS."
  s.description  = "A customizable slideshow view for iOS which uses the dissolve effect to transition between the pictures."
  s.homepage     = "https://github.com/jhabr/JHSlideShowView"
  s.license      = 'MIT'
  s.author       = { "Jaro Habr" => "jaro.habr@freshbits.ch" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/jhabr/JHSlideShowView.git", :tag => s.version.to_s }
  s.source_files  = 'JHSlideShowView/*.{h,m}'
  s.requires_arc = true
end
