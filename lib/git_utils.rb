
module GitUtils

  def github_repo_exists?(name)
    not `git list-charms | grep #{@name}`.empty?
  end

  def github_create(name, description, website)
    #puts "creating \"#{name}\" \"#{description}\" \"#{website}\""
    `git create "#{name}" "#{description}" "#{website}"`
  end

  def git_remote_exists?(clone_directory, remote_name, remote_url)
    not `cd #{clone_directory} && git remote | grep #{remote_name}`.empty?
    #existing_name, existing_url, push = `cd #{clone_directory} && git remote -v | grep push`.split
  end

  def git_add_remote(clone_directory, remote_name, remote_url)
    #puts "adding remote #{clone_directory} #{remote_name} #{remote_url}"
    `cd #{clone_directory} && git remote add #{remote_name} #{remote_url}`
  end

  def git_push(clone_directory, remote_name = "github", remote_branch = "master")
    #puts "pushing from #{clone_directory} to #{remote_name} #{remote_branch}"
    `cd #{clone_directory} && git push #{remote_name} #{remote_branch}`
    
    #TODO  merge problems?
    
    #TODO  push --force?
    
  end

end
