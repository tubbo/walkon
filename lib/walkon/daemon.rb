module Walkon
  class Daemon
    def initialize
      @devices = BluetoothDevice.all
    end

    def self.start
      new.check_for_devices
    end

    def check_for_devices
      loop do
        BluetoothDevice.each do |device|
          devices << device unless devices.include? device
          sleep 5
        end
      end
    end
  end
end
