require File.expand_path('../lib/foreman_v1/version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'foreman_v1'
  s.version     = ForemanV1::VERSION
  s.date        = Date.today.to_s
  s.authors     = ['TODO: Your name']
  s.email       = ['TODO: Your email']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of ForemanV1.'
  # also update locale/gemspec.rb
  s.description = 'TODO: Description of ForemanV1.'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'deface'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rdoc'
end
