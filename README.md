# Technation Sama Intranet

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e98759ab0c0f4f81bc8689827be0af3a)](https://www.codacy.com/app/victorjambo/intranet?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=technation-sama/intranet&amp;utm_campaign=Badge_Grade)
[![License](https://poser.pugx.org/laravel/framework/license.svg)](http://opensource.org/licenses/MIT)

**Sama Intranet** is our organization's private network.

## Usage

It is recommended that you have the following set up on your local environment before getting started

1. [Ruby ~> 2.4.0](https://www.ruby-lang.org/en/downloads/)
2. [Ruby on Rails ~> 5.0.4](http://rubyonrails.org/)
3. [Postgres](http://www.postgresql.org)
4. [Git](https://git-scm.com)

Clone the repository into your local environment

```bash
$ git clone git@github.com:technation-sama/intranet.git
```

Change directory into `intranet`

```bash
$ cd intranet
```

Run bundle to install all the gems

```bash
$ bundle install
```

### Setting up environmental variables
create `environment_variables.yml` file in the `config` folder.

Add these in the file you just created

```bash
development:
  GMAIL_USERNAME: yourEmail
  GMAIL_PASSWORD: your email password
  DATABASE_USER: database user
  DATABASE_PASSWORD: password for your database 
test:
  GMAIL_USERNAME: yourEmail
  GMAIL_PASSWORD: your email password
  DATABASE_USER: database user
  DATABASE_PASSWORD: password for your database 
production:
  GMAIL_USERNAME: your_email
  GMAIL_PASSWORD: your email password
```

Remember to changer the values of `DATABASE_USER` and `DATABASE_PASSWORD` based on the Postgres roles you created


Run the migrations

```bash
$ rails db:create db:migrate
```

If you wish to populate your database with [Faker gem](https://github.com/stympy/faker) run this;

```bash
$ rake db:populate
```

## Tests

No test available. App is still in development stage

## Contributing

Contributions are **welcome** and will be fully **credited**.

## Security

If you discover any security related issues, please create an issue in the repo.

## Credits

* [mwenda-eric](https://github.com/mwenda-eric)
* [victorjambo](https://github.com/victorjambo)
* [ThaDeveloper](https://github.com/ThaDeveloper)
* [eunice12jk](https://github.com/eunice12jk)
* [gtsofa](https://github.com/gtsofa)
* [gwako94](https://github.com/gwako94)
* [omondi20](https://github.com/omondi20)
* [Raycode21](https://github.com/Raycode21)

## License

### The MIT License (MIT)

Copyright (c) 2017 Technation developers

Licensed under the [MIT license](http://opensource.org/licenses/MIT).
