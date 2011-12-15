
module GitUtils

  def github_repo_exists?(name)
    #`git list-charms | grep #{@name}`
    false
  end

  def github_create(name, description, website)
    #`git create "#{name}" "#{description}" "#{website}"` unless github_repo_exists?(name)
    `git create "#{name}" "#{description}" "#{website}"`
  end

  def git_remote_exists?(clone_directory, remote_name, remote_url)
    false
  end

  def git_add_remote(clone_directory, remote_name, remote_url)
    #unless git_remote_exists?(clone_directory, remote_name, remote_url)
    #  `cd #{clone_directory} && git remote add #{remote_name} #{remote_url}`
    #end
    `cd #{clone_directory} && git remote add #{remote_name} #{remote_url}`
  end

  def git_push(clone_directory, remote_name = "github", remote_branch = "master")
    `cd #{clone_directory} && git push #{remote_name} #{remote_branch}`
    
    #TODO  merge problems?
    
    #TODO  push --force?
    
  end

end
