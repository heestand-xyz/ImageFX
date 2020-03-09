Pod::Spec.new do |spec|

  spec.name         = "ImageFX"
  spec.version      = "0.1.1"

  spec.summary      = "Image Effects"
  spec.description  = <<-DESC
            		  Image Effects in Swift.
            		  Powered by Metal through PixelKit.
                      DESC

  spec.homepage     = "http://pixelkit.dev"
  
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Hexagons" => "anton@hexagons.se" }
  spec.social_media_url   = "https://twitter.com/anton_hexagons"

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"
  spec.tvos.deployment_target = "13.0"
  
  spec.swift_version = '5.1'

  spec.source       = { :git => "https://github.com/hexagons/imagefx.git", :branch => "master", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/ImageFX", "Sources/ImageFX/**/*.swift"
	
  spec.dependency 'LiveValues', '~> 1.1.7'
  spec.dependency 'RenderKit', '~> 0.3.6'
  spec.dependency 'PixelKit', '~> 1.0.0'

end
