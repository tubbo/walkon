# Finds and plays the entrance music for a given device.

module Walkon
  class EntranceMusic
    attr_reader :filename

    def initialize with_file_name
      @filename = "#{prefix}/#{with_file_name}.mp3"
    end

    def exists?
      File.exists? filename
    end

    alias present? exists?

    def play
      present? and play_track
    end

    def play_track
      `xmms #{filename}` == ''
    end

    def prefix
      if Walkon.env == 'test'
        File.expand_path "../../../spec/fixtures/music", __FILE__
      else
        "/music"
      end
    end
  end
end
