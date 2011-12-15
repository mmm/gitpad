
class Repo

  def Repo.mirror(name, source_url, target_url)
    repo = Repo.new(name)
    repo.pull_from(source_url)
    repo.push_to(target_url)
  end

  def initialize(name = nil)
    @name = name
  end

  def working_directory
    "#{File.dirname(__FILE__)}/../projects/#{name}"
  end

  def has_working_directory?
    File.exists?(working_directory)
  end

  def pull_from(url)
    # behave differently based on url format
    #`cd $CACHE_DIR && git bzr clone $repo`
    #  cache dir exists?
    #    pull from lp
    #  else
    #    clone from lp
  end

  def push_to(url)
    # behave differently based on url format
    #
    # check github repo exists
    # add remote to local clone
    # push to github
    #
    #
    #  if [ -d $charm_name ]; then
    #    cd $charm_name
    #    git create charms/$charm_name "Mirror of juju charm, pull requests and modifications welcome!" "http://charms.kapilt.com/charms/oneiric/$charm_name"
    #    git remote add github git@github.com:charms/$charm_name
    #    git push github master
    #    cd ..
    #  fi
    #  
    #  merge problems?
    #
    #  push --force?
    #
    ###################3
    #
    #  find or create github remote
    #  add it
    #
    #  pull github remote
    #
    #  merge
    #
    #  push up to github remote
    #
    #  problems?
    #    just wipe github version and push fresh
    #
  end

end
