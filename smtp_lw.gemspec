# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smtp_lw/version'

Gem::Specification.new do |spec|
  spec.name          = "smtp_lw"
  spec.version       = SmtpLw::VERSION
  spec.authors       = ["Locaweb"]
  spec.email         = ["desenvolvedores@locaweb.com.br"]
  spec.summary       = %q{This is the ruby client for SMTP Locaweb product.}
  spec.description   = %q{This is the ruby client for SMTP Locaweb product.}
  spec.homepage      = "https://github.com/locaweb/smtp_lw"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'dotenv'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "minitest-reporters"
end
