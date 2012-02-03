# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "susuwatari/version"

Gem::Specification.new do |s|
  s.name        = "susuwatari"
  s.version     = Susuwatari::VERSION
  s.authors     = ["Benjamin Krause"]
  s.email       = ["benjamin@moviepilot.com"]
  s.homepage    = ""
  s.summary     = %q{Simple Wrapper around the API of webpagetest.org}
  s.description = %q{Allows to schedule tests on webpagetest.org}

  s.rubyforge_project = "susuwatari"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rest-client"
end
