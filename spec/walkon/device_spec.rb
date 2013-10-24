require 'spec_helper'
require 'walkon/device'

module Walkon
  describe Device do
    subject { Device.new '00:A1:5D:AB:B2:E9' }

    before do
      Playlist.stub :cue
    end

    it "looks for entrance music based on MAC address" do
      expect(subject.entrance_music).to \
        match(/#{subject.mac_address}\.mp3\Z/)
    end

    it "finds entrance music in configured dir" do
      expect(subject).to have_entrance_music
    end

    it "enqueues a track to be played" do
      expect(subject.play).to be_true
      expect(Playlist).to receive(:cue)
    end
  end
end
