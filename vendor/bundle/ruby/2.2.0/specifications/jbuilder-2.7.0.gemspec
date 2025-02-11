# -*- encoding: utf-8 -*-
# stub: jbuilder 2.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jbuilder"
  s.version = "2.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Heinemeier Hansson"]
  s.date = "2017-06-05"
  s.email = "david@basecamp.com"
  s.homepage = "https://github.com/rails/jbuilder"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.6"
  s.summary = "Create JSON structures via a Builder-style DSL"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 4.2.0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 1.2"])
    else
      s.add_dependency(%q<activesupport>, [">= 4.2.0"])
      s.add_dependency(%q<multi_json>, [">= 1.2"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 4.2.0"])
    s.add_dependency(%q<multi_json>, [">= 1.2"])
  end
end
