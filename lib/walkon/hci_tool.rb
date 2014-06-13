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
      @results += scan_results_ess_ids
      @results = @results.uniq
      @results
    end

    private
    def scan_results_ess_ids
      each_line = /\A(..:..:..:..:..:..)\s(.*)\Z/
      scan_results.reduce([]) do |collection, line|
        line.scan each_line do |(mac_addr,ess_id)|
          collection << ess_id.strip
        end

        collection
      end
    end

    def scan_results
      `hcitool scan`.split "\n"
    end
  end
end
