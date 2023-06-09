# Nla::BlacklightCommon

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/nla/nla-blacklight_common/verify.yml?branch=main&logo=github)](https://github.com/nla/nla-blacklight_common/actions/workflows/verify.yml)
[![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/nla/nla-blacklight_common?include_prereleases)](https://github.com/nla/nla-blacklight_common/releases/latest)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

Common functionality for Blacklight and ArcLight applications, primarily:

- Allows users and sessions to be stored in a shared database separate from the host application's database.
- A Blacklight repository to connect with a collection on a ZooKeeper managed SolrCloud cluster.

## Usage
This is an "unmounted" Rails engine and is in the same scope as the host application it's integrated into.

### Configuration
This engine requires the following environment variables to be defined in the Blacklight/ArcLight
host application:

* `DATABASE_URL` - Primary application database
* `PATRONS_DB_URL` - User and sessions database
* `ZK_HOST` - ZooKeeper connection string
* `SOLR_COLLECTION` - name of the Solr collection
* `GETALIBRARYCARD_BASE_URL` - Base URL of the Get A Library Card authentication endpoint
* `GETALIBRARYCARD_AUTH_PATH` - Path to the authentication endpoint
* `GETALIBRARYCARD_PATRON_DETAILS_PATH` - Path to the patron details endpoint
* `PATRON_AUTH_URL` - Base URL to the User Reg application
* `PATRON_AUTH_ENDPOINT` - Path to the authentication endpoint
* `KC_SOL_CLIENT` - Staff Official Loan realm client
* `KC_SOL_SECRET` - Staff Official Loan realm client secret
* `KC_SOL_REALM` - Staff Official Loan realm name
* `KC_SPL_CLIENT` - Staff Personal Loan realm client
* `KC_SPL_SECRET` - Staff Personal Loan realm client secret
* `KC_SPL_REALM` - Staff Personal Loan realm name
* `KC_SHARED_CLIENT` - Staff Shared Account realm client
* `KC_SHARED_SECRET` - Staff Shared Account realm client secret
* `KC_SHARED_REALM` - Staff Shared Account realm name

### Scheduled tasks
This engine uses [activerecord-session_store](https://github.com/rails/activerecord-session_store)
to store a user's session in the database rather than in a cookie. This allows more control around
terminating user sessions, as well as improved security.

This also overrides the `db:sessions:trim` and `db:sessions:clear` tasks to use the
`CatalogueSession` class that connects to the "patrons" table.

There is a scheduled task that runs `db:sessions:trim` once a day (and 15 mins. after a deployment)
to trim sessions older than 30 days from the database. This task is scheduled using
[rufus-scheduler](https://github.com/jmettraux/rufus-scheduler) instead of cron and configured in
`config/initializers/scheduler.rb`.

🚨 Since `rufus-scheduler` is an in-process, in-memory scheduler, it will only run tasks while
the host application is running.

## Installation

### Gemfile
Add this line to your host application's Gemfile:

```ruby
gem "nla-blacklight_common", git: "https://github.com/nla/blacklight_common", tag: "[choose a tag]"
```
or to use the latest code on the `main` branch:

```ruby
gem "nla-blacklight_common", git: "https://github.com/nla/blacklight_common"
```

And then execute:
```bash
$ bundle
```

### Database configuration
Modify the host application's `config/database.yml` file to
[support multiple databases](https://guides.rubyonrails.org/active_record_multiple_databases.html).

There is a `config/database.yml.sample` file that can be used as a guide.

Mostly it involves redefining your main database connection as the "primary" for every environment
definition in the file, then adding a "patrons" connection to every environment.

### Migrations
Migrations need to be copied into the host application from this engine using the following command:

```bash
$ rails g nla:blacklight_common:install
```

🚨 This command needs to be performed whenever new migrations are added to this engine and will only
copy migrations which do not already exist in the host application.

And then execute:
```bash
$ rails db:migrate
```

## Contributing
✏️ This repository uses [conventional commits](https://www.conventionalcommits.org)
and commit messages are used to generate `CHANGELOG.md` and release body entries.

The most important prefixes you should have in mind are:

* `fix:` which represents bug fixes, and correlates to a SemVer patch.
* `feat:` which represents a new feature, and correlates to a SemVer minor.
* `feat!:`, or `fix!:`, `refactor!:`, etc., which represent a breaking change (indicated by the !)
  and will result in a SemVer major.

This repository also follows [Trunk Based Development](https://trunkbaseddevelopment.com/) practices.

💡 It's important to understand, that developers should be "fixing forward" on the `main` branch,
rather than on a release branch. This means that if a bug is found in production, the fix should be
merged into `main` and then cherry-picked into a `hotfix` release branch. See [Fixing production
bugs on Trunk](https://trunkbaseddevelopment.com/branch-for-release/#fix-production-bugs-on-trunk).

🚀 Releases are automated via GitHub workflows based on the expectation that developers are
following Trunk Based Development practices. See more in the ["Releases"](#releases) section below.

### Setup
`bin/setup` will configure Bundler to install gems into the `vendor/bundle` directory and install
all dependencies.

💡 Installing gems into `vendor/bundle` serves to isolate the versions of gems used in this project
from other Ruby projects on your development machine.

#### Containers

🚨 Blacklight Solr adapter specs are executed against a local SolrCloud cluster.
You will need [Podman](https://podman.io/) to create a container for this cluster using the
`docker-compose.yml` file in the `solr` directory.

In order to run this cluster successfully, you'll need a Podman machine with at least 4GB of memory
and 6GB of disk space.

The Podman machine created below will be initialised with 2 CPUs and 6GB of memory and disk space.

```bash
podman machine init --cpus 2 --disk-size 6144 --memory 6144  # initialise a Podman machine
podman machine start                                         # start the Podman machine
podman-compose -f ./solr/docker-compose.yml up -d            # spin up a ZK + SolrCloud cluster
podman-compose -f ./solr/docker-compose.yml down --volumes   # pull down the ZK + SolrCloud cluster
```

### Testing
There is a `bin/ci` script that will run specs, perform linting and security analysis.

⚠️ This script will automatically setup and tear down a SolrCloud cluster for the Blacklight Solr
adapter specs. See the ["Containers"](#containers) section above for more information.

There is a GitHub Actions workflow named `verify.yml` that lints and runs the RSpec test suite
whenever the following two events occur:

* A pull request that is targeted at the `main` branch is created or updated.
* Updates are committed directly against the `main` branch.

### Releases
Releases are automated via GitHub workflows . This uses Google's [release-please
action](https://github.com/google-github-actions/release-please-action) to create release pull
requests when changes are pushed to `main`, `release` or `hotfix` branches (depending on the nature
of the release). These workflows are defined in `.github/workflows/` and have comments describing
how they behave and should be used.

🚨 `CHANGELOG.md` is also automatically created/updated in these release pull requests from
commit message summaries when a change is pushed to the respective branch, as mentioned above.

These workflows will automatically create and tag a release when a release pull request is merged.

## License
The gem is available as open source under the terms of the [Apache 2 License](https://opensource.org/licenses/Apache-2.0).
