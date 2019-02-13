# frozen_string_literal: true

# Ruby Version
ruby '2.6.1'

# Rubygems Source
source 'https://rubygems.org' do # Regular gems
  # Middleman Rocks
  gem 'middleman', '~>3.3.12'
  gem 'middleman-minify-html'
  gem 'wp2middleman'

  # Live-reloading plugin
  gem 'middleman-livereload', '~> 3.1.0'

  # Sitemap
  # gem 'middleman-search_engine_sitemap'

  # Blog Support
  gem 'middleman-blog'
  gem 'nokogiri'
  gem 'sanitize'

  # For faster file watcher updates on Windows:
  gem 'wdm', '~> 0.1.0', platforms: %i[mswin mingw]

  # Windows does not come with time zone data
  gem 'tzinfo-data', platforms: %i[mswin mingw jruby]

  # Favicon
  gem 'middleman-favicon-maker'

  # Extra stuff for AWS Support
  gem 'middleman-aws'
  gem 'middleman-cloudfront'
  gem 'middleman-s3_sync'

  # Markdown Engine
  gem 'redcarpet'

  # Testing
  group :development do
    gem 'capybara'
    gem 'rake'
    gem 'rspec'
    gem 'rubocop'
  end
end

# For laziness lets use rails-assets.org for bower components
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  # gem 'rails-assets-moment'
  # gem 'rails-assets-moment-timezone'
  gem 'rails-assets-backbone'
  gem 'rails-assets-bootstrap-sass'
  gem 'rails-assets-fontawesome'
  gem 'rails-assets-modernizr'
  gem 'rails-assets-select2', '~> 4.0.0.rc.1'
  gem 'rails-assets-select2-bootstrap'
  gem 'rails-assets-selectize'
  # gem 'rails-assets-bootstrap-daterangepicker'
  # gem 'rails-assets-eternicode--bootstrap-datepicker'
  # gem 'rails-assets-bootstrap3-datetimepicker'
  gem 'rails-assets-bootstrap-validator'
  gem 'rails-assets-classie'
  gem 'rails-assets-jquery-cookie'
  gem 'rails-assets-respond'
end
