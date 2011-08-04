require 'yaml'

class Command

  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def execute
    system(@command)
    #puts "would execute #{@command}"
  end

  # log
  # return values
  # exceptions

  def Command.execute(command)
    Command.new(command).execute
  end
  
end

