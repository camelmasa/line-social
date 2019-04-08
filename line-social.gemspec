
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "line/social/version"

Gem::Specification.new do |spec|
  spec.name          = "line-social"
  spec.version       = Line::Social::VERSION
  spec.authors       = ["camelmasa"]
  spec.email         = ["camelmasa@gmail.com"]

  spec.summary       = %q{Ruby client for LINE social API}
  spec.description   = %q{Ruby client for LINE social API}
  spec.homepage      = "https://github.com/camelmasa/line-social"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.15"
  spec.add_dependency "faraday_middleware", "~> 0.13"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
