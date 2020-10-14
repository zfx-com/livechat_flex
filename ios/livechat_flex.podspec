#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint livechat_flex.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'livechat_flex'
  s.version          = '0.0.1'
  s.summary          = 'A flutter plugin project for live chat inc.'
  s.description      = <<-DESC
A flutter plugin project for live chat inc.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Oceantech' => 'jk@oceantech.asia' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'LiveChat', '~> 2.0.20'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS' => 'armv7 arm64 x86_64' }
  s.swift_version = '5.0'
end
