
module GitBzrUtils

  def git_bzr_pull(clone_directory, url)
    #`cd #{clone_directory} && git bzr pull #{url}`
    `cd #{clone_directory} && git bzr pull`
  end

  def git_bzr_clone(base_directory, url, clone_directory)
    `cd #{base_directory} && git bzr clone #{url} #{clone_directory}`
  end

end
