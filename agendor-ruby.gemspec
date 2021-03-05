# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'agendor/version'

Gem::Specification.new do |s|
  s.name = 'agendor-ruby'
  s.version = Agendor::VERSION
  s.required_ruby_version = '>= 2.5.0'
  s.required_rubygems_version = '>= 2.0.0'
  s.require_paths = ['lib']
  s.authors = ['Bruno Ghisi', 'Nathan Thiesen', 'Vicente Silveira Inácio']
  s.date = '2016-06-03'
  s.description = 'Agendor CRM ruby client'
  s.email = 'brunogh@gmail.com'
  s.extra_rdoc_files = [
    'LICENSE.txt'
  ]
  s.files = [
    '.document',
    'Gemfile',
    'Gemfile.lock',
    'LICENSE',
    'README.md',
    'Rakefile',
    'VERSION',
    'agendor-ruby.gemspec',
    'lib/agendor-ruby.rb',
    'lib/agendor/base.rb',
    'lib/agendor/entity.rb',
    'lib/agendor/deal.rb',
    'lib/agendor/organization.rb',
    'lib/agendor/person.rb',
    'lib/agendor/token.rb',
    'lib/agendor/version.rb'
  ]
  s.homepage = 'http://github.com/brunogh/agendor-ruby'
  s.licenses = ['MIT']
  s.summary = 'Agendor CRM ruby client'

  s.add_runtime_dependency 'faraday', '>= 0.17.0'
  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
