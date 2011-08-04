require 'command'

module Github
  attr_accessor :github_url
  def clone
    Command.execute("git clone #{github_url} #{working_dir}")
  end
end

module Launchpad
  attr_accessor :launchpad_url
  def push
    Command.execute("cd #{working_dir}; git bzr init && git bzr push #{launchpad_url}")
  end
end

class Project
  include Github
  include Launchpad

  attr_accessor :name

  def working_dir
    "/home/mmm/projects/canonical/gitpad/projects/#{name}"
  end

end

