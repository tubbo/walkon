# A collection of device names gathered from HciTool.

module Walkon
  class HciTool
    def initialize
      @results = []
    end

    def self.scan
      new.scan
    end

    def scan
      results.reduce([]) do |collection, line|
        if line =~ /(?<mac_address>..:..:..:..:..:..)/
          collection << mac_address
        end

        collection
      end
    end

    private
    def results
      `hcitool scan`.split "\n"
    end
  end
end
