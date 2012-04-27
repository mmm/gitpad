
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

  def Repo.update(name, description, homepage)
    repo = Repo.new(name)
    repo.github_update(name,description,homepage)
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
      git_bzr_clone( CACHE_DIR, url, @name )
    end
  end

  def push_to(url)

    #TODO behave differently based on url format
    
    raise "no working directory... you need to pull first" unless has_working_directory?

    repo_name = "charms/#{@name}"
    repo_desc = "Mirror of juju charm, pull requests and modifications welcome!"
    repo_site = "http://charms.kapilt.com/charms/precise/#{@name}"
    github_create(repo_name, repo_desc, repo_site) unless github_repo_exists?(repo_name)

    git_add_remote(working_directory, "github", url) unless git_remote_exists?(working_directory, "github", url)

    # safe to push with no new changes... just wasteful
    git_push(working_directory, "github")
    # fails?  perhaps try this over again with --force?
    #    maybe just wipe github version and push fresh
  end

end
