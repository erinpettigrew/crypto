# -*- encoding: utf-8 -*-
# stub: fog-digitalocean 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-digitalocean"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["JJ Asghar", "Suraj Shirvankar"]
  s.date = "2016-03-30"
  s.description = "DigitalOcean fog provider gem"
  s.email = ["jj@chef.io", "surajshirvankar@gmail.com"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "http://github.com/fog/fog-digitalocean"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.4.6"
  s.summary = "DigitalOcean fog provider gem"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<shindo>, ["~> 0.3"])
      s.add_development_dependency(%q<rubyzip>, ["~> 0.9.9"])
      s.add_development_dependency(%q<mime-types>, [">= 0"])
      s.add_development_dependency(%q<mime-types-data>, [">= 0"])
      s.add_development_dependency(%q<rubocop>, [">= 0"])
      s.add_runtime_dependency(%q<fog-core>, ["~> 1.42"])
      s.add_runtime_dependency(%q<fog-json>, [">= 1.0"])
      s.add_runtime_dependency(%q<fog-xml>, [">= 0.1"])
      s.add_runtime_dependency(%q<ipaddress>, [">= 0.5"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<shindo>, ["~> 0.3"])
      s.add_dependency(%q<rubyzip>, ["~> 0.9.9"])
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<mime-types-data>, [">= 0"])
      s.add_dependency(%q<rubocop>, [">= 0"])
      s.add_dependency(%q<fog-core>, ["~> 1.42"])
      s.add_dependency(%q<fog-json>, [">= 1.0"])
      s.add_dependency(%q<fog-xml>, [">= 0.1"])
      s.add_dependency(%q<ipaddress>, [">= 0.5"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<shindo>, ["~> 0.3"])
    s.add_dependency(%q<rubyzip>, ["~> 0.9.9"])
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<mime-types-data>, [">= 0"])
    s.add_dependency(%q<rubocop>, [">= 0"])
    s.add_dependency(%q<fog-core>, ["~> 1.42"])
    s.add_dependency(%q<fog-json>, [">= 1.0"])
    s.add_dependency(%q<fog-xml>, [">= 0.1"])
    s.add_dependency(%q<ipaddress>, [">= 0.5"])
  end
end
