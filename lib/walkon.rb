require "walkon/version"
require "walkon/daemon"

module Walkon
  def self.start
    Walkon::Daemon.start
  end

  def self.found_hcitool?
    !!`hcitool -h`
  rescue Errno::ENOENT
    false
  end

  def self.env
    ENV['WALKON_ENV'] || 'development'
  end
end
