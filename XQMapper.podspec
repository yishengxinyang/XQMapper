#
# Be sure to run `pod lib lint XQMapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XQMapper'
  s.version          = '0.1.0'
  s.summary          = 'json和模型相互转化映射工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "json转模型，json字符串转模型；模型转json的映射工具"

  s.homepage         = 'https://github.com/xiexiangqing/XQMapper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xiexiangqing' => '1373867490@qq.com' }
  s.source           = { :git => 'https://github.com/xiexiangqing/XQMapper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'XQMapper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'XQMapper' => ['XQMapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
