#
# Be sure to run `pod lib lint TableModulesKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TableModulesKit"
  s.version          = "0.9"
  s.summary          = "Reusable ViewController with TableView, splitted in Sections"

  s.description      = "Reusable ViewController with TableView, split in Sections (called here modules) that help you to develop faster in Swift"

  s.homepage         = "https://github.com/cosmicfools/ModulesKit"
  s.license          = 'MIT'
  s.author           = { "Francisco Javier Trujillo Mata" => "fjtrujy@gmail.com" }
  s.source           = { :git => "https://github.com/cosmicfools/ModulesKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fjtrujy'

  s.ios.deployment_target = '9.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.swift_version = '5.0'
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |ss|
    ss.source_files = 'Sources/ModulesKit/**/*'
  end
  
  s.subspec 'Tests' do |ss|
    ss.dependency 'TableModulesKit/Core'
    ss.dependency 'CombinationGenerator', '~> 0.1'
    ss.source_files = 'Sources/ModulesKitSnapshot/**/*'
  end

end
