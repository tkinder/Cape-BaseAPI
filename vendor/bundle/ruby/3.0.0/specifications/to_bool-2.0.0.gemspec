# -*- encoding: utf-8 -*-
# stub: to_bool 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "to_bool".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bryan Ricker".freeze]
  s.date = "2019-10-23"
  s.description = "Super-simple gem that extends some Ruby classes with a \"to_bool\" method, which converts any object naturally into a boolean.".freeze
  s.email = ["bryancricker@gmail.com".freeze]
  s.homepage = "http://github.com/bricker/to_bool".freeze
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Convert any object naturally into a boolean".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
