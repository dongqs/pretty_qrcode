# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "pretty_qrcode"
  spec.version       = "0.0.1"
  spec.authors       = ["Dong Qingshan"]
  spec.email         = ["dongqs@gmail.com"]
  spec.summary       = %q{Pretty QRCode Generator}
  spec.description   = %q{Generate pretty QR code}
  spec.homepage      = "http://github.com/dongqs/pretty_qrcode"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rmagick", "~> 2.13"
  spec.add_dependency "rqrcode", "~> 0.4"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
