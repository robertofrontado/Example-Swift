platform :ios, '9.0'
use_frameworks!

def shared_pods
  pod 'Kingfisher'
  pod 'Swinject'
  pod 'SwinjectStoryboard'
  pod 'OkDataSources'
  pod 'PKHUD', '~> 4.0'
  pod 'ObjectMapper'
  pod 'RxSwift', '~> 3.0'
  pod 'Moya/RxSwift'
  pod 'Moya-ObjectMapper/RxSwift'
end

target 'Example-iOS' do
  shared_pods
end

target 'Example-iOSTests' do
  shared_pods
  pod 'Quick'
  pod 'Nimble'
end
