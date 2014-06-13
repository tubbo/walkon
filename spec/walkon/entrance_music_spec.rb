require 'spec_helper'
require 'walkon/entrance_music'

module Walkon
  describe EntranceMusic do
    subject { EntranceMusic.new 'iPhone5' }

    context "when the mp3 file is found" do
      before do
        allow(File).to receive(:exists?).with(subject.filename).and_return true
      end

      it "is considered to be present" do
        expect(subject).to be_present
      end

      it "is considered to be existant" do
        expect(subject).to be_exists
      end

      it "runs an xmms command to play the track" do
        allow(subject).to receive(:play_track).and_return true
        expect(subject.play).to eq(true)
      end
    end

    context "when the mp3 file is not found" do
      before do
        allow(File).to receive(:exists?).with(subject.filename).and_return false
      end

      it "is considered not present" do
        expect(subject).to_not be_present
      end

      it "is considered non-existant" do
        expect(subject).to_not be_exists
      end

      it "will not run the xmms command to play track" do
        expect(subject.play).to eq(false)
      end
    end
  end
end
