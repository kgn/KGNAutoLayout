Pod::Spec.new do |spec|
  spec.name = 'KGNAutoLayout'
  spec.version = '1.5.2'
  spec.authors = {'David Keegan' => 'me@davidkeegan.com'}
  spec.homepage = 'https://github.com/kgn/KGNAutoLayout'
  spec.summary = 'KGNAutoLayout makes AutoLayout easy!'
  spec.source = {:git => 'https://github.com/kgn/KGNAutoLayout.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.platform = :ios, '8.0'
  spec.requires_arc = true
  spec.frameworks = 'UIKit'
  spec.source_files = 'Source/KGNAutoLayout.swift'
end
