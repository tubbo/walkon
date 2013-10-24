# A collection of device names gathered from HciTool.

module Walkon
  class HciTool
    attr_accessor :results

    def initialize
      @results = []
    end

    def self.scan
      new.scan
    end

    def scan
      @results = scan_results.reduce([]) do |collection, line|
        line.scan FOR_MAC_ADDRESS do |mac_address|
          collection << mac_address.first
        end

        collection
      end
    end

    private
    FOR_MAC_ADDRESS = /(..:..:..:..:..:..)/
    def scan_results
      `hcitool scan`.split "\n"
    end
  end
end
