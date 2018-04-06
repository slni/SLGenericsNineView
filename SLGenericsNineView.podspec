#
#  Be sure to run `pod spec lint SLGenericsNineView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SLGenericsNineView"
  s.version      = "1.2.0"
  s.summary      = "泛型九宫格布局"
  s.description  = <<-DESC 
                    通过泛型的思想，对九宫格布局的代码进行封装，更简单的九宫格布局控件。
                    DESC
  # 首页（我的简书）
  s.homepage     = "https://github.com/slni/SLGenericsNineView.git"
  # 源代码位置
  s.source = { :git => "https://github.com/slni/SLGenericsNineView.git", :tag => "#{s.version}" }
  s.source_files = "SLGenericsNineView/SLGenericsNineView/Source/*.{swift,h,m}"
  #s.source_files = "SLGenericsNineView/**/*.{swift,h,m}"

  s.swift_version = "4.0"
  # 许可,一般MIT
  s.license = "MIT"
  s.author  = { "slni" => "610112090@qq.com" }
  s.platform = :ios, "8.0"
  #s.ios.deployment_target = '8.0'
  #s.osx.deployment_target = '10.10'
  #s.tvos.deployment_target = '9.0'
  #s.watchos.deployment_target = '2.0'
  # 依赖三方的框架
  # s.dependency 'AFNetworking', '~> 1.0'
  # s.dependency 'Alamofire'
  # s.dependency 'Moya'
  # s.dependency 'SwiftyJSON'
  # s.dependency 'PromiseKit'
  # s.dependency 'SnapKit'
  # 依赖系统的框架
  # s.ios.framework = 'CFNetwork'
  
end