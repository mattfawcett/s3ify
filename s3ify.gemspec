# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{s3ify}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mattfawcett"]
  s.date = %q{2009-06-25}
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
  s.add_dependency 'visionmedia-commander'
  s.add_dependency 'nokogiri'
  s.add_dependency 'aws-s3'
  

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
