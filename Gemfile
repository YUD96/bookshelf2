source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'
gem 'slim'
gem 'mysql2'
gem "shrine", "~> 3.0"
gem "image_processing", "~> 1.8"
# gem "shrine-rom"
gem 'bcrypt'
gem 'hanami-bootstrap'
gem 'sassc'


group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
	gem "better_errors"
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
	gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
