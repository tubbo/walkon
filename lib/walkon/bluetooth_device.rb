require 'enumerable'

module Walkon
  class BluetoothDevice
    include Enumerable

    def initialize
    end

    def self.all
      `hcitool scan`.split("\n").each do |line|
        
      end
    end
  end
end
