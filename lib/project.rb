require 'command'

module Github
  attr_accessor :github_url
  def pull
    if has_working_directory?
      pull_cache
    else
      clone
    end
  end
  private
  def pull_cache
    Command.execute("cd #{working_directory}; git pull")
  end
  def clone
    Command.execute("git clone #{github_url} #{working_directory}")
  end
end

module Launchpad
  attr_accessor :launchpad_url
  def push
    if has_bzr_remote?
      push_repo
    else
      push_new_repo
    end
  end
  private
  def push_new_repo
    Command.execute("cd #{working_directory}; git bzr init && git bzr push #{launchpad_url}")
  end
  def push_repo
    Command.execute("cd #{working_directory}; git bzr push")
  end
  def has_bzr_remote?
    File.exists?("#{working_directory}/.git/bzr")
  end
end

class Project
  include Github
  include Launchpad

  attr_accessor :name

  def working_directory
    "/home/mmm/projects/canonical/gitpad/projects/#{name}"
  end
  def has_working_directory?
    File.exists?(working_directory)
  end

end

