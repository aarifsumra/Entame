# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rx_swift
  pod 'RxSwift'
end

def rx_cocoa
  pod 'RxCocoa'
end

def test_pods
  pod 'RxTest'
  pod 'RxBlocking'
  pod 'Quick'
  pod 'Nimble'
end

target 'EntaMe' do
  use_frameworks!
  rx_cocoa
  rx_swift
  
  target 'EntaMeTests' do
    inherit! :search_paths
    test_pods
  end
end

target 'Domain' do
  use_frameworks!
  rx_swift
  
  target 'DomainTests' do
    inherit! :search_paths
    test_pods
  end
end

target 'Platform' do
  use_frameworks!
  rx_swift
  
  pod 'Moya/RxSwift'

  target 'PlatformTests' do
    inherit! :search_paths
    test_pods
  end
  
end
