# README

This project is intended to submit badges to Chainpoint blockchain. The badge is a SHA256 value which is computed from three input values: issue_date, recipient_name and uuid. These values can be inserted from the landing page and submitted to the blockchain from there too.

If you have any question about this project, feel free to reach me. Any feedback is also welcome.

## Resources
  - Rails 5.2.6
  - Ruby 2.5.7
  - No Database added
  - No Active Record module enabled
  - Additional gems:
    - webpacker
    - slim-rails
    - jquery-ui-rails
    - jquery-rails
    - httparty
    - pry
    - rails-controller-testing
    - rspec-rails [DEV, TEST]
    - factory_bot_rails [DEV, TEST]
  - Additional JS libraries:
    - stimulus

## How to run
  1. clone repo
  2. bundle install
  3. yarn install
  4. rails s

## How to run tests
  1. rake spec

## Notes
  - All form fields are mandatory.
  - The form to submit badges needs to have a data attribute called `data-badge-blockchain`. You will see an error if this is not set. eg `data-badge-blockchain="chainpoint"`.

