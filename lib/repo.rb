
require 'git_utils'
require 'git_bzr_utils'

class Repo

  include GitUtils
  include GitBzrUtils

  def Repo.mirror(name, source_url, target_url)
    repo = Repo.new(name)
    repo.pull_from(source_url)
    repo.push_to(target_url)
  end

  def initialize(name = nil)
    @name = name
  end

  CACHE_DIR = "#{File.dirname(__FILE__)}/../projects"
  def working_directory
    "#{CACHE_DIR}/#{@name}"
  end

  def has_working_directory?
    File.exists?(working_directory)
  end

  def pull_from(url)

    #TODO behave differently based on url format
    
    if has_working_directory?
      #TODO check the .git/config entry is the same url
      git_bzr_pull( working_directory, url )
    else
      git_bzr_clone( CACHE_DIR, url, working_directory )
    end
  end

  def push_to(url)

    #TODO behave differently based on url format
    
    raise "no working directory... you need to pull first" unless has_working_directory?

    #TODO check github repo exists
    # otherwise, create it
    github_create("charms/#{@name}",
                  "Mirror of juju charm, pull requests and modifications welcome!",
                  "http://charms.kapilt.com/charms/oneiric/#{@name}" )

    git_add_remote(working_directory, "github", url)

    git_push(working_directory, "github")

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
