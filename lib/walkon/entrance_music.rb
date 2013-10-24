require 'walkon/playlist'

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
      return true if Walkon.env == 'test'
      Playlist.cue filename
    end

    private
    def prefix
      if Walkon.env == 'test'
        File.expand_path("../../../spec/fixtures/music", __FILE__)
      else
        "/music"
      end
    end
  end
end
