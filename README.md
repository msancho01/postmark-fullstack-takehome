# Postmark Full-Stack Developer Test Project by Martin Sancho

## Setting things up
* `cp .env-example .env` and update the `.env` file with a valid Postmark Server API token.
* Install the Ruby version found in [.ruby-version](/.ruby-version)
* Install [NVM](https://github.com/creationix/nvm).
* Run `nvm install` in the repository root.
* Install [Yarn](https://yarnpkg.com/en/docs/install) (required by Webpacker).
  For install Yarn, I prefer use Hombrew, If you don't have Homebrew installed, you can install it by running:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```
To install yarn:
```
brew install yarn

```
* Depending on your platform, you might need to install libsqlite3 for SQLite support.
* In the terminal, run `bundle install`.
* Before to run the app, in the terminal, run the rake task to populate the most recent Snapshot. `bin/rake snapshot:take`.
* Run the Rails server `bin/rails server` and open [http://localhost:3000/](http://localhost:3000/) in your browser. Now you should be able to see the Graph with the communication information.
