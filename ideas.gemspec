# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ideas/version'

Gem::Specification.new do |gem|
  gem.name          = 'ideas'
  gem.version       = Ideas::VERSION
  gem.authors       = ['Maxim Dobryakov']
  gem.email         = ['support+ideas-gem@protonail.com']
  gem.summary       = 'Gem for describe and share your ideas'
  gem.description   = ''
  gem.homepage      = 'http://protonail.com/ideas'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'ZenTest'
end
