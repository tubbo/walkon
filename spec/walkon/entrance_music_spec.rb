require 'spec_helper'
require 'walkon/entrance_music'

module Walkon
  describe EntranceMusic do
    let(:mac_address) { "00:A1:5D:AB:B2:E9" }
    let(:device) do
      dev = double :device
      dev.stub(:mac_address) { mac_address }
      dev
    end
    subject { EntranceMusic.new device }

    before do
      Playlist.stub(:cue) { true }
    end

    it "finds entrance music" do
      expect(subject).to be_present
    end

    it "enqueues file to be played via xmms" do
      expect(subject.play).to be_true
    end
  end
end
