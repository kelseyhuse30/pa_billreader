# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pa_billreader/version'

Gem::Specification.new do |spec|
  spec.name          = "pa_billreader"
  spec.version       = PaBillreader::VERSION
  spec.authors       = ["Kelsey Huse"]
  spec.email         = ["kelseyhuse30@gmail.com"]

  spec.summary       = "CLI gem to read PA bills from congress website"
  spec.description   = "This gem will scrape the house and senate websites to get bill numbers, descriptions, and sponsors."
  spec.homepage      = "https://github.com/kelseyhuse30/pa_billreader"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
