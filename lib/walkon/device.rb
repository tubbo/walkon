require 'walkon/entrance_music'

# Represents a single Bluetooth device in the building. When HciTool
# detects the device on the network, it plays the entrance music.

module Walkon
  class Device
    attr_reader :ess_id, :entrance_music

    def initialize from_ess_id
      @ess_id = from_ess_id
      @entrance_music = EntranceMusic.new from_ess_id
    end

    def self.play! for_ess_id
      device = new for_ess_id
      device.play
      device
    end

    def play
      return unless has_entrance_music?
      entrance_music.play
    end

    def has_entrance_music?
      entrance_music.exists?
    end
  end
end
