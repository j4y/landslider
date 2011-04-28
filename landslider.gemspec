# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{landslider}
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jay Prall"]
  s.date = %q{2011-04-28}
  s.description = %q{Landslider is a ruby interface to the Landslide SOAP-based API}
  s.email = %q{jay@j4y.net}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG.markdown",
    "Gemfile",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "init.rb",
    "landslider.gemspec",
    "lib/landslider.rb",
    "test/landslider_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{https://github.com/j4y/landslider}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Landslide Ruby}
  s.test_files = [
    "test/landslider_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jeweler>, [">= 0"])
      s.add_runtime_dependency(%q<handsoap>, [">= 1.1.8"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<handsoap>, [">= 1.1.8"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<handsoap>, [">= 1.1.8"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

