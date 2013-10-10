
# GitPad ( LaunchHub?, HubPad? )

This is a bridge to dual-host and mirror projects from launchpad to github.

Just a set of scripts that use git-bzr-ng to mirror projects

Currently just mirrors from lp to github.


# Installation

- ruby w/ gems:
  - json
  - restclient
  - rspec
- git w/ plugins:
  - git-create
  - git-list-charms
  - git-bzr-ng
- bzr w/ plugins:
  - bzr-fastexport
- charm-tools

# Usage

## sample cronjob

    # m h  dom mon dow   command

    @daily $HOME/projects/canonical/gitpad/bin/mirror >> $HOME/projects/canonical/gitpad/mirror.log 2>&1

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
  - rake for status?
  - rake for control


#TODO

- capture external deps.... bzr config, git config, github api tokens, etc
- integrate oauth2 into the actual scripts... i.e., add `get_app_token` scripts
- move all scripts over to oauth
- separate branch for two-way mirroring development
- need to get series branches in...
  - perhaps look at all lp:~charmers branches instead of just lp:charms
  - do something with hadoop-xxx oneiric charms?
  - do something special with the lp:charms branches... i.e., "master"
  - can this be done automatically?  perhaps we need to maintain a manual mapping of bzr branchs?
    are there bzr tools to help with this... i.e., lp:~charmers/charms/<charm-name> as the main repo
    with several branches?


