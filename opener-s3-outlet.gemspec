require File.expand_path('../lib/opener/s3_outlet/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'opener-s3-outlet'
  gem.version     = Opener::S3Outlet::VERSION
  gem.authors     = ['development@olery.com']
  gem.summary     = 'S3 Bucket data storing for the web services output when using callbacks.'
  gem.description = gem.summary
  gem.homepage    = "http://opener-project.github.com/"
  gem.has_rdoc    = 'yard'
  gem.license     = 'Apache 2.0'

  gem.required_ruby_version = '>= 1.9.2'

  gem.files = Dir.glob([
    'exec/**/*',
    'lib/**/*',
    'config.ru',
    '*.gemspec',
    'README.md',
    'LICENSE.txt'
  ]).select { |file| File.file?(file) }

  gem.executables = Dir.glob('bin/*').map { |file| File.basename(file) }

  gem.add_dependency 'opener-kaf2json'
  gem.add_dependency 'opener-daemons', '~> 2.2'
  gem.add_dependency 'opener-webservice', '~> 2.1'
  gem.add_dependency 'opener-core', '~> 2.2'

  gem.add_dependency 'builder'
  gem.add_dependency 'nokogiri'

  gem.add_development_dependency 'rake'
end
