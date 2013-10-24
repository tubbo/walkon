require 'spec_helper'
require 'walkon/device'

module Walkon
  describe Device do
    subject { Device.new '00:A1:5D:AB:B2:E9' }

    it "registers a mac address with the daemon" do
      expect(subject.mac_address).to_not be_nil
    end

    it "finds entrance music in configured dir" do
      expect(subject).to have_entrance_music
    end
  end
end
