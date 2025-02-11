# -*- encoding: utf-8 -*-
# stub: spring 2.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "spring"
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jon Leighton"]
  s.date = "2017-05-21"
  s.description = "Preloads your application so things like console, rake and tests run faster"
  s.email = ["j@jonathanleighton.com"]
  s.executables = ["spring"]
  s.files = ["bin/spring"]
  s.homepage = "https://github.com/rails/spring"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Rails application preloader"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 4.2"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<bump>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 4.2"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<bump>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 4.2"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<bump>, [">= 0"])
  end
end
