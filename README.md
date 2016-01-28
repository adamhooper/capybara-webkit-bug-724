To reproduce https://github.com/thoughtbot/capybara-webkit/issues/724

```sh
gem install bundler
bundle install
rspec
```

Expected results: tests pass
Actual results: a test fails because the server returns a 304 status
