# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'accio/version'

Gem::Specification.new do |gem|
  gem.name          = "accio"
  gem.version       = Accio::VERSION
  gem.authors       = ["Dennis Schneider"]
  gem.email         = ["sinned.schneider@gmail.com"]
  gem.description   = %q{Accio is a code snippet management tool for the terminal}
  gem.summary       = %q{Accio - A code snippet management tool for the terminal}
  gem.homepage      = "https://github.com/dschneider/accio"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('thor')
  gem.add_runtime_dependency('term-ansicolor')
  gem.add_runtime_dependency('clipboard')
  gem.add_runtime_dependency('terminal-table')

  gem.add_development_dependency('rspec')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('simplecov')
end
