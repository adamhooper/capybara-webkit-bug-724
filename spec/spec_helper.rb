require 'rubygems'
require 'bundler/setup'

require 'capybara/rspec'
require 'capybara-webkit'

Capybara.configure do |config|
  config.default_driver = :webkit

  config.app = Rack::Builder.new(quiet: true) do
    use(Rack::Static,
        urls: { '/a-page' => 'a-page.html' },
        root: 'html',
        header_rules: [[ :all, { 'Cache-Control' => 'no-cache' } ]]
    )

    run lambda { |env| [ 404, { 'Content-Type' => 'text/html; charset=utf-8' }, [ 'Not Found' ]] }
  end
end

Capybara::Webkit.configure do |config|
end
