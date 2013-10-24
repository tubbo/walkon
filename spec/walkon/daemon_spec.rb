require 'spec_helper'
require 'walkon/daemon'

module Walkon
  describe Daemon do
    let(:mac_address) { "00:A1:5D:AB:B2:E9" }
    let(:sample_output) do
      %(
        Scanning....
           #{mac_address}  Nokia 6600
       )
    end

    before do
      subject.stub(:scanned_devices) { [mac_address] }
      subject.check_for_devices
    end

    it "adds the sample mac address to devices" do
      expect(subject.devices.map(&:mac_address)).to include(mac_address)
    end

    it "plays device's entrance music" do
      expect(subject.devices).to_not be_empty
      device = subject.devices.select { |device| device.mac_address == mac_address }.first
      expect(device).to_not be_nil
      expect(device).to have_entrance_music
    end
  end
end
