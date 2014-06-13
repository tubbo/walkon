require 'spec_helper'
require 'walkon/device'

module Walkon
  describe Device do
    subject { Device.new 'iPhone5' }

    it "requires a ess id for identification" do
      expect(subject.ess_id).to_not be_nil
      expect(subject.ess_id).to eq('iPhone5')
    end

    it "uses ess id to find entrance music in configured dir" do
      expect(subject).to have_entrance_music
    end

    it "delegates to the entrance music to play" do
      allow(subject.entrance_music).to receive(:play_track).and_return true
      expect(subject.play).to eq(true)
    end

    it "does not play when no entrance music" do
      allow(subject).to receive(:has_entrance_music?).and_return false
      expect(subject.play).to_not eq(true)
    end
  end
end
