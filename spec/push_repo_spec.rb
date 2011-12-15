require 'spec_helper'
require 'repo'

describe Repo do

  describe "push_to (repo doesn't exist)" do

    before(:each) do
      @repo_name = 'testrepo'
      @repo = Repo.new(@repo_name)
      @repo.pull_from("lp:charm/mysql")
    end

    after(:each) do
      `git destroy charms/#{@repo_name}`
      @cache_dir = File.join(File.dirname(__FILE__), "..", "projects", @repo_name) 
      FileUtils.rm_rf(@cache_dir)
    end 

    it 'should create a new repo' do
      @repo.push_to("git@github.com:charms/#{@repo_name}")
      `git list-charms | grep #{@repo_name}`.should_not be_empty
    end

  end

  describe "push_to (repo already exists)" do

    before(:each) do
      @repo_name = 'testrepo'
      @repo = Repo.new(@repo_name)
      @repo.pull_from("lp:charm/mysql")
      @repo.push_to("git@github.com:charms/#{@repo_name}")
    end

    after(:each) do
      #`git destroy @repo_name`
      @cache_dir = File.join(File.dirname(__FILE__), "..", "projects", @repo_name) 
      FileUtils.rm_rf(@cache_dir)
    end 

    it 'should not fail when pushing to an existing repo' do
      @repo.push_to("git@github.com:charms/#{@repo_name}")
      `git list-charms | grep #{@repo_name}`.should_not be_empty
    end

  end

end

