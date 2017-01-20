#
# Be sure to run `pod lib lint KPLiveDebugger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KPLiveDebugger'
  s.version          = '0.1.0'
  s.summary          = 'KPLiveDebugger is a live onScreen debugger which can show logs on screen'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#  s.description      = <<-DESC
  s.homepage         = 'https://github.com/kunal08pandey/KPLiveDebugger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kunal Pandey' => 'kunal08.pandey@gmail.com' }
  s.source           = { :git => 'https://github.com/kunal08pandey/KPLiveDebugger.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KPLiveDebugger/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KPLiveDebugger' => ['KPLiveDebugger/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SwiftyBeaver', '0.7'
end
