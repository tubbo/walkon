require 'spec_helper'
require 'walkon/daemon'

module Walkon
  describe Daemon do
    it "scans for new devices with hcitool" do
      expect(subject).to respond_to(:scanned_devices)
    end

    context "when given a sample output from hcitool" do
      let(:mac_address) { "00:A1:5D:AB:B2:E9" }
      let(:output) do
        %(
          Scanning....
             #{mac_address}  Nokia 6600
         )
      end
      let(:device) { subject.devices.find mac_address }
      before do
        subject.stub(:scanned_devices) { output }
        device.stub :play_entrance_music
        subject.check_for_devices
      end

      it "adds the sample mac address to devices" do
        expect(subject.devices).to include(mac_address)
      end

      it "plays device's entrance music" do
        expect(device).to have_entrance_music
        expect(device).to receive(:play_entrance_music)
      end
    end
  end
end
