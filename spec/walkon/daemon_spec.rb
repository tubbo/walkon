require 'spec_helper'
require 'walkon/daemon'

module Walkon
  describe Daemon do
    context "when a new device is detected" do
      let(:mac_address) { "00:A1:5D:AB:B2:E9" }

      before do
        subject.stub(:scanned_devices) { [mac_address] }
        subject.stub(:play_entrance_music_for) { |device| true }
        subject.check_for_devices
      end

      it "adds the sample mac address to devices" do
        expect(subject.devices.map(&:mac_address)).to include(mac_address)
      end

      it "plays device's entrance music" do
        expect(subject.devices).to_not be_empty
        device = subject.devices.select { |dev| dev.mac_address == mac_address }.first
        expect(device).to_not be_nil
        expect(device).to have_entrance_music
      end
    end
  end
end
