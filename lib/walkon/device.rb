require 'walkon/playlist'

# Represents a single Bluetooth device in the building.

module Walkon
  class Device
    attr_reader :mac_address, :entrance_music

    def initialize with_mac_address
      @mac_address = with_mac_address
      @entrance_music = EntranceMusic.new self
    end

    def has_entrance_music?
      entrance_music.exists?
    end
  end
end
