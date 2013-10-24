require 'spec_helper'

module Walkon
  describe HciTool do
    let(:mac_address) { "00:A1:5D:AB:B2:E9" }
    let(:sample_output) do
      %(
        Scanning....
           #{mac_address}  Nokia 6600
       ).split("\n")
    end

    before do
      subject.stub(:scan_results) { sample_output }
    end

    it "starts with no results" do
      expect(subject.results).to be_empty
    end

    it "finds mac addresses with a scan" do
      expect(subject.scan).to_not be_empty
      expect(subject.results.first).to eq(mac_address)
    end
  end
end
