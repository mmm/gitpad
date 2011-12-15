
class Repo

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
      `cd #{working_directory} && git bzr pull`
    else
      `cd #{CACHE_DIR} && git bzr clone #{url} #{working_directory}`
    end
  end

  def push_to(url)

    #TODO behave differently based on url format
    
    raise "no working directory... pull first" unless has_working_directory?

    # check github repo exists
    `git create charms/#{@name} "Mirror of juju charm, pull requests and modifications welcome!" "http://charms.kapilt.com/charms/oneiric/#{@name}"`

    # add remote to local clone
    `cd #{working_directory} && git remote add github #{url}`

    # push to github
    `cd #{working_directory} && git push github master`

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
