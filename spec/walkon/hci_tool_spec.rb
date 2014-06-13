require 'spec_helper'

module Walkon
  describe HciTool do
    let :results do
      [
        'Scanning...',
        '00:A1:5D:AB:B2:E9 iPhone5'
      ]
    end

    before do
      allow(subject).to receive(:scan_results).and_return results
    end

    it "starts with no results" do
      expect(subject.results).to be_empty
    end

    it "finds ess ids with a scan" do
      expect(subject.scan).to_not be_empty
      expect(subject.results.first).to eq('iPhone5')
    end
  end
end
