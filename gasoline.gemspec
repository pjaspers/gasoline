# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gasoline/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["pjaspers"]
  gem.email         = ["piet@jaspe.rs"]
  gem.description   = %q{Gasoline makes Campfire even brighter}
  gem.summary       = %q{Gasoline aims to make managing the patch file easier.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gasoline"
  gem.require_paths = ["lib"]
  gem.version       = Gasoline::VERSION

  gem.add_runtime_dependency("thor", ["~> 0.15.4"])
end
