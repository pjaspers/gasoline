# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gasoline/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["pjaspers"]
  gem.email         = ["piet@jaspe.rs"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gasoline"
  gem.require_paths = ["lib"]
  gem.version       = Gasoline::VERSION

  gem.add_runtime_dependency("thor", ["~> 0.15.4"])
end
