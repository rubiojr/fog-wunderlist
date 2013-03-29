# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fog-wunderlist"
  spec.version       = "0.1"
  spec.authors       = ["Sergio Rubio"]
  spec.email         = ["rubiojr@frameos.org"]
  spec.description   = %q{www.wunderlist.com Fog provider}
  spec.summary       = %q{www.wunderlist.com Fog provider}
  spec.homepage      = "https://github.com/rubiojr"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency('fog', '>= 1.0')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "shindo"
end
