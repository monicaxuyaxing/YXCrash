#
# Be sure to run `pod lib lint YXCrash.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YXCrash'
  s.version          = '0.1.0'
  s.summary          = 'A short description of YXCrash.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  "YXCrash防止数组、KVO等可导致程序crash框架，可降低线上程序崩溃概率"
                        DESC

  s.homepage         = 'https://gitee.com/monicaFighting/YXCrash'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'monicaFighting' => '1577003764@qq.com' }
  s.source           = { :git => 'https://gitee.com/monicaFighting/YXCrash.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YXCrash/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YXCrash' => ['YXCrash/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
