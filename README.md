
# GitPad ( LaunchHub?, HubPad? )

This is a bridge to dual-host and mirror projects from launchpad to github.

Just a set of scripts that use git-bzr-ng to mirror projects


# Installation

- ruby
- gems
  - json
  - restclient
  - rspec
- git w/ plugins:
  - git-create
  - git-list-charms
- git-bzr-ng
- bzr
- charm-tools

## sample cronjob

    SHELL=/bin/bash
    HOME=/home/mmm
    PATH=/home/mmm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    MAILTO=mark.mims@canonical.com

    # m h  dom mon dow   command

    @daily $HOME/projects/canonical/gitpad/bin/mirror >> $HOME/projects/canonical/gitpad/mirror.log 2>&1

# Usage

## one-way mirror

see `bin/mirror`... it essentially:

every so often:
  - pull from lp
  - merge these two (just use bzr/master)
    - what to do in conflicts?
      - nothing? 
      - just report status?
      - send notification?
  - create github repo unless it exists
  - push up to github


needs:
  - cronjobs
  - rake for status?
  - rake for control
  - sinatra for status?


# or...

what about capistrano?

capistrano's used to working with multiple repos, projects, remote stuff, etc
can probably get away with cap tasks to do all of this from local machine

would it be better to use rake locally?


maybe at least use some ideas from cap...
`local_cache`?


So what should this look like?

maybe...

cap to deploy the basic app...

but then cap to control the app too?


#TODO

- capture external deps.... bzr config, git config, github api tokens, etc
- use git config to keep github api tokens for these dependent scripts
- pull github api scripts into the lib... they're separate deps atm
- separate branch for two-way mirroring development

