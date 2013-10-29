require 'walkon/device'

# Finds and plays the entrance music for a given device.

module Walkon
  class EntranceMusic
    attr_reader :device, :filename

    def initialize from_device
      @device = from_device
      @filename = "#{prefix}/#{@device.mac_address}.mp3"
    end

    def exists?
      File.exists? filename
    end

    alias present? exists?

    def play
      return false unless exists?
      `xmms #{filename}`
    end

    private
    def prefix
      if Walkon.env == 'test'
        File.expand_path "../../../spec/fixtures/music", __FILE__
      else
        "/music"
      end
    end
  end
end
