require "bundler/gem_tasks"
require 'bundler/setup'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :test

desc "Provision a local development VM"
task :vm do
  if `which vagrant` == ""
    puts "Error: You must install Vagrant to use this feature."
    exit 1
  end

  sh 'vagrant up'
end

task :default => %w(test build)
