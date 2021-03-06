# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{s3ify}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mattfawcett"]
  s.date = %q{2009-07-08}
  s.default_executable = %q{s3ify}
  s.email = %q{matt@bolseragency.com}
  s.executables = ["s3ify"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/s3ify",
     "lib/s3ify.rb",
     "s3ify.gemspec",
     "spec/fixtures/expected/index.html",
     "spec/fixtures/original/images/image1.jpg",
     "spec/fixtures/original/images/image2.jpg",
     "spec/fixtures/original/images/image3.jpg",
     "spec/fixtures/original/images/nested/image4.jpg",
     "spec/fixtures/original/index.html",
     "spec/fixtures/original/s3_index.html",
     "spec/s3ify_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/mattfawcett/s3ify}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Upload HTML emails to S3}
  s.test_files = [
    "spec/s3ify_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<visionmedia-commander>, ["= 3.2.9"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<aws-s3>, [">= 0"])
    else
      s.add_dependency(%q<visionmedia-commander>, ["= 3.2.9"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<aws-s3>, [">= 0"])
    end
  else
    s.add_dependency(%q<visionmedia-commander>, ["= 3.2.9"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<aws-s3>, [">= 0"])
  end
end
