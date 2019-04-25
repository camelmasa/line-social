lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'line/social/version'

Gem::Specification.new do |spec|
  spec.name = 'line-social'
  spec.version = Line::Social::VERSION
  spec.authors = %w[camelmasa]
  spec.email = %w[camelmasa@gmail.com]

  spec.summary = 'Ruby client for LINE Social API'
  spec.description = 'Ruby client for LINE Social API'
  spec.homepage = 'https://github.com/camelmasa/line-social'
  spec.license = 'MIT'

  spec.files =
    Dir.chdir(File.expand_path('..', __FILE__)) do
      `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
      end
    end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_dependency 'faraday', '~> 0.15'
  spec.add_dependency 'faraday_middleware', '~> 0.13'
  spec.add_dependency 'virtus', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
