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
create `environment_variables.yml` file in the `config` folder. (you dont need this file if you are on cloud9)

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

## Image processing

Intranet uses mini_magick for image processing.

ImageMagick. Carrierwave can use either RMagick or MiniMagick (default). To change resize option the correct gem must be used (specified in Gemfile) and change included setting for Carrierwave in file_uploader.rb
Can be installed from: http://www.imagemagick.org

or run

```bash
sudo apt-get update
sudo apt-get install imagemagick
```

### cloud9
For c9.io users installation process is same although for a few changes. You dont need to create `environment_variables.yml` file. Secondly you have to start postgresql service by running the command;
```bash
sudo service postgresql start
```
Finally before running `rake db:create db:migrate` goto `config/database.yml` and change value of `encoding:` to `SQL_ASCII`

## Tests

I know right we need to get this done

## Contributing

Contributions are **welcome** and will be fully **credited**.

## Security

If you discover any security related issues, please create an issue in the repo.

## Credits

* [Eric Mwenda](https://github.com/mwenda-eric)
* [Victor Mutai](https://github.com/victorjambo)
* [Justin Ndwiga](https://github.com/ThaDeveloper)
* [Eunice Kamar](https://github.com/eunice12jk)
* [Julius tsofa](https://github.com/gtsofa)
* [Galgallo Wako](https://github.com/gwako94)
* [Ben Omondi](https://github.com/omondi20)
* [Raycode](https://github.com/Raycode21)
* Irene Kamene - documentation and user manual

## License

### The MIT License (MIT)

Copyright (c) 2017 Technation developers

Licensed under the [MIT license](http://opensource.org/licenses/MIT).
