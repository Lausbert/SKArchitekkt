Pod::Spec.new do |s|
    s.name             = 'SKArchitekkt'
    s.version          = '0.1.1'
    s.summary          = 'An implementation of a root node handler, based on SpriteKit.'
    
    s.description      = <<-DESC
    An implementation of a root node handler, based on SpriteKit.
    DESC
    
    s.homepage         = 'https://github.com/Lausbert/SKArchitekkt'
    s.author           = { 'Lausbert' => 'stephanlerner@icloud.com' }
    s.source           = { :git => 'https://github.com/Lausbert/SKArchitekkt.git', :tag => s.version.to_s }
    
    s.platform = :osx
    s.osx.deployment_target = "10.14"
    s.swift_version = '5.0'
    
    s.source_files = 'SKArchitekkt/Source/**/*'
    
    s.dependency 'CoreArchitekkt'
end
