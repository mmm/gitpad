require 'yaml'

class Command

  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def execute
    puts "about to execute: #{@command}"
    system(@command)
    puts "done executing: #{@command}"
  end

  # log
  # return values
  # exceptions

  def Command.execute(command)
    Command.new(command).execute
  end
  
end

