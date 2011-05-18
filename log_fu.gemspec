# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "log_fu/version"
require "log_fu/engine"
require 'rake'

Gem::Specification.new do |s|
  s.name        = "log_fu"
  s.version     = LogFu::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["blackanger"]
  s.email       = ["blackanger.z@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Simple hits log with MongoDB}
  s.description = %q{Simple website hits log with MongoDB}
  s.files       =  FileList["[A-Z]*", "{app,config,lib}/**/*"]
  s.extra_rdoc_files = FileList["[A-Z]*"] - %w(Gemfile Rakefile)
  s.rubyforge_project = "log_fu"

  
  s.require_paths = ["lib"]
  s.add_dependency "rails", "3.0.6"
end
