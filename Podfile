platform :ios, '9.0'
use_frameworks!

def shared_pods
  pod 'Kingfisher'
  pod 'Swinject'
  pod 'SwinjectStoryboard'
  pod 'OkDataSources'
  pod 'PKHUD', '~> 4.0'
  pod 'ObjectMapper'
  pod 'Alamofire', '~> 4.4'
  pod 'AlamofireObjectMapper', '~> 4.0'
  pod 'RxSwift', '~> 3.0'
  pod 'RxAlamofire'
end

target 'Example-iOS' do
  shared_pods
end

target 'Example-iOSTests' do
  shared_pods
  pod 'Quick'
  pod 'Nimble'
end
