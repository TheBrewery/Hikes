platform :ios, '9.0'
use_frameworks!

pod 'AlamofireImage', '~> 2.4.0'
pod 'Alamofire', '~> 3.4.0'
pod 'ObjectMapper', '~> 1.3.0'
pod 'RealmSwift', '~> 0.103.1'
pod 'SKPhotoBrowser', '~> 1.8.8'

pod 'Static', :path => '../Static/'
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
