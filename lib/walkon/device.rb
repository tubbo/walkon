require 'enumerable'
require 'walkon/collection'
require 'walkon/playlist'

# Represents a single Bluetooth device in the building.

module Walkon
  class Device
    include Enumerable

    attr_reader :mac_address

    def initialize with_mac_address
      @mac_address = with_mac_address
    end

    def self.all
      Collection.from_devices
    end

    def has_entrance_music?
      File.exists? entrance_music_path
    end

    def play
      Playlist.cue entrance_music
    end

    def entrance_music
      @entrance_music ||= "/music/#{mac_address}.mp3"
    end
  end
end
