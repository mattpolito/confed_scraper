# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "confed_scraper/version"

Gem::Specification.new do |s|
  s.name        = "confed_scraper"
  s.version     = ConfedScraper::VERSION
  s.authors     = ["Matt Polito"]
  s.email       = ["matt.polito@gmail.com"]
  s.homepage    = "http://github.com/mattpolito/confed_scraper"
  s.summary     = %q{Site scrapers to ease data import into Confed}
  s.description = %q{Site scrapers to ease data import into Confed}

  s.rubyforge_project = "confed_scraper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "pry"
  s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "nokogiri"
end
