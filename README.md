# Hatate

Hatate is an opinionated Ruby on Rails application generator. It makes a whole
bunch of choices that I like, and I hope you like them too.

## Usage

Install the Hatate gem:

    gem install hatate

Then run:

    hatate new <app_name>

## What's included?

- Postgres
- Tailwind CSS
- Propshaft
- Hotwire
- RSpec
- FactoryBot
- Capybara
- Cuprite
- Standard
- GitHub Actions

## Development

Hatate requires the latest Ruby version.

Clone the repo, then run:

    bin/setup

Run tests with:

    bundle exec rspec

And run Standard with:

    bundle exec standardrb

You can step in to a console with:

    bin/console

## Releasing

1. Bump the version number in `lib/hatate/version.rb`
1. Run `bundle exec rake release`, which will create a git tag for the version,
   push git commits and the created tag, and push the `.gem` file to
   [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
