# blacklight-solrcloud-repository

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/nla/blacklight-solrcloud-repository/Tests%20and%20code%20quality?label=Tests%20and%20code%20quality&logo=github)
![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/nla/blacklight-solrcloud-repository?include_prereleases)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

A Blacklight repository to connect with a collection on a ZooKeeper managed SolrCloud cluster.

The main ideas for this gem come from the [rsolr-cloud](https://github.com/enigmo/rsolr-cloud) gem.
Unfortunately that gem seems abandoned and depends on RSolr v1, whilst Blacklight uses RSolr v2.

## Usage

This repository requires the following ENV variables be defined in the Blacklight/Arclight application:

* `ZK_HOST` - ZooKeeper connection string
* `SOLR_COLLECTION` - name of the Solr collection

## Installation

Add this line to your Blacklight/ArcLight application's Gemfile, replacing `[choose a tag]` with a release tag.

```ruby
gem "blacklight-solrcloud-repository", git: "https://github.com/nla/blacklight-solrcloud-repository", tag: '[choose a tag]'
```

And then execute:

```bash
$ bundle install
```

## Contributing

✏️ This repository uses [conventional commits](https://www.conventionalcommits.org)
and commit messages are used to generate `CHANGELOG.md` and release body entries.

The most important prefixes you should have in mind are:

* `fix:` which represents bug fixes, and correlates to a SemVer patch.
* `feat:` which represents a new feature, and correlates to a SemVer minor.
* `feat!:`, or `fix!:`, `refactor!:`, etc., which represent a breaking change (indicated by the !) and will result in a SemVer major.

Releases are automated via GitHub workflows. See more in the ["Releases"](https://github.com/nla/blacklight-solrcloud-repository#releases) section below.

### Setup

`bin/setup` will configure Bundler to install gems into the `vendor/bundle` directory and install all dependencies.

    ⚠️ Installing gems into `vendor/bundle` serves to isolate the versions of gems used in this project from other Ruby projects on your development machine.

#### Containers

🚨 Specs are executed against a local SolrCloud cluster. You will need [Podman](https://podman.io/)
to create a container for this cluster using the `docker-compose.yml` file in the `solr` directory.

Create local Solr cluster:

```bash
podman-compose -f ./solr/docker-compose.yml up -d
```

Destroy container and volumes when finished:

```bash
podman-compose -f ./solr/docker-compose.yml down --volumes
```

### Testing

There is a `bin/ci` script that will create/teardown the cluster, run specs, perform linting and security analysis.

You can otherwise run each command in that script individually if you wish.

### Releases

Releases are automated via the `release.yml` GitHub workflow. This uses Google's 
[release-please action](https://github.com/google-github-actions/release-please-action) to create pull
requests when changes are pushed to main. It will bump the version automatically and create a release 
when the pull request is merged. Read more about how 
[release-please](https://github.com/googleapis/release-please) works.

🚨 `CHANGELOG.md` is automatically created/updated for each release based on the commit messages.

## License
The gem is available as open source under the terms of the [Apache 2 License](https://opensource.org/licenses/Apache-2.0).
