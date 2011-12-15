require 'spec_helper'
require 'repo'

describe Repo do

  describe "has_working_directory?" do

    before(:each) do
      @repo_name = 'testrepo'
      @repo = Repo.new(@repo_name)
      @cache_dir = File.join(File.dirname(__FILE__), "..", "projects", @repo_name) 
    end

    after(:each) do
      FileUtils.rm_rf(@cache_dir)
    end 

    it 'should show the cache directory is not there' do
      @repo.has_working_directory?.should be_false
    end

    it 'should show the cache directory is already there' do
      Dir.mkdir(@cache_dir)
      @repo.has_working_directory?.should be_true
    end

  end

end

