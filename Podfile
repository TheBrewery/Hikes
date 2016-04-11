platform :ios, '9.0'
use_frameworks!

pod 'AlamofireImage', '~> 2.2.0'
pod 'Alamofire', '~> 3.1.4'
pod 'ObjectMapper', '~> 1.0.1'
pod 'RealmSwift', '~> 0.98.6'

pod 'FBAnnotationClusteringSwift', :path => '../FBAnnotationClusteringSwift/'

def testing_pods
	pod 'Quick', '~> 0.9.2'
    pod 'Nimble', '~> 4.0.0'
end

target 'World Heritage Tests' do
   	testing_pods
end

target 'World Heritage UITests' do
   	testing_pods
end
