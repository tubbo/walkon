require 'spec_helper'
require 'walkon/daemon'

module Walkon
  describe Daemon do
    it "runs the loop" do
      expect(subject).to respond_to(:run)
    end

    it "starts from the command line" do
      expect(subject.class).to respond_to(:start)
    end

    context "when a new device is detected" do
      before do
        allow(HciTool).to receive(:scan).and_return ['iPhone5']
        allow(Device).to receive(:play!).and_return Device.new('iPhone5')
        subject.send :check_for_devices
      end

      it "adds the sample ess id to devices" do
        expect(subject.devices.map(&:ess_id)).to include('iPhone5')
      end

      it "plays device's entrance music" do
        expect(subject.devices).to_not be_empty
        device = subject.devices.first
        expect(device).to_not be_nil
        expect(device).to have_entrance_music
      end
    end
  end
end
