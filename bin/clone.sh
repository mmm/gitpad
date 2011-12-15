#!/bin/bash

def reverse_order(list)
end
repos = `charm list | grep lp:charm`
time_ordered_repos = repos.split.reverse.join("\n")

for repo in $repos
do
  git bzr clone $repo
  charm_name=${repo//*\/}
  echo $charm_name

  if [ -d $charm_name ]; then
    cd $charm_name
    git create charms/$charm_name "Mirror of juju charm, pull requests and modifications welcome!" "http://charms.kapilt.com/charms/oneiric/$charm_name"
    git remote add github git@github.com:charms/$charm_name
    git push github master
    cd ..
  fi
done
