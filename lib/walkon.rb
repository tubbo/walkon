require "walkon/version"
require "walkon/daemon"

module Walkon
  def self.start
    Walkon::Daemon.start
  end

  def self.env
    ENV['WALKON_ENV'] || 'development'
  end
end
