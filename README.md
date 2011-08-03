
# GitPad ( LaunchHub?, HubPad? )

This is a bridge to dual-host and mirror projects on launchpad and github.

Just a set of scripts that use git-bzr-ng to mirror a list of projects mapped in projects.yml.


# Usage

## one-way mirror

One way to do this is to use github as a master

every so often:
  - pull from github
  - push to lp
  - log shit
  - maybe update status?
  - maybe send notification?
  - or maybe generate status on request?

needs:
  - cronjobs
  - rake for status?
  - rake for control
  - sinatra for status?

## sync

no master... merge

every so often:
  - pull from github
  - pull from lp
  - merge these two (manage on separate branches? just use bzr/master?)
    - what to do in conflicts?
      - nothing? 
      - just report status?
      - try to fix?
      - send notification?
  - push back to github
  - push back to lp

needs:
  - cronjobs
  - rake for status?
  - rake for control
  - sinatra for status?
  - sinatra for control?
    (is there something like a sinatra rake runner already?)


# Notes

 - check out `mr`


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


