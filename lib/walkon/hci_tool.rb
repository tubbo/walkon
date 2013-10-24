require 'enumerable'

# A collection of device names gathered from HciTool.

module Walkon
  class HciTool
    include Enumerable

    def initialize
      @addresses = []
    end

    def add mac_address
      @addresses << mac_address
    end

    def self.scan
      results.reduce(self.new) do |collection, line|
        if line =~ /(?<mac_address>..:..:..:..:..:..)/
          collection.add mac_address
        end

        collection
      end
    end

    def each
      @addresses.each { |mac_address| yield mac_address }
    end

    private
    def self.results
      `hcitool scan`.split "\n"
    end
  end
end
