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
      subject.stub(:play) { "" }
    end

    it "finds an mp3 file to play" do
      expect(subject).to be_present
    end

    it "plays the mp3 file if found" do
      expect(subject.play).to be_true
    end
  end
end
