require 'resque'

# A wrapper around Resque so we can switch out the queue if need be.
# Also acts as its worker.

module Walkon
  class Playlist
    def self.cue entrance_music
      Resque.enqueue Playlist, entrance_music
    end

    def perform entrance_music
      `xmms #{entrance_music}`
    end
  end
end
