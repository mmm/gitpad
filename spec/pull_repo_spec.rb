require 'spec_helper'
require 'repo'

describe Repo do

  describe "pull_from (uncached)" do

    before(:each) do
      @repo_name = 'mysql'
      @repo = Repo.new(@repo_name)
      @cache_dir = File.join(File.dirname(__FILE__), "..", "projects", @repo_name) 
    end

    after(:each) do
      FileUtils.rm_rf(@cache_dir)
    end 

    it 'should clone from a good url' do
      FileUtils.rm_rf(@cache_dir)
      @repo.pull_from("lp:charm/mysql")
      @repo.has_working_directory?.should be_true
    end

  end

  describe "pull_from (cached)" do

    before(:each) do
      @repo_name = 'mysql'
      @repo = Repo.new(@repo_name)
      @repo.pull_from("lp:charm/mysql")
      @cache_dir = File.join(File.dirname(__FILE__), "..", "projects", @repo_name) 
    end

    after(:each) do
      FileUtils.rm_rf(@cache_dir)
    end 

    it 'should update a cached repo from a good url' do
      @repo.pull_from("lp:charm/mysql")
      @repo.has_working_directory?.should be_true
    end

  end

end

