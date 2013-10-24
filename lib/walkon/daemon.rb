require 'walkon/device'
require 'walkon/hci_tool'

# The process which listens for new Devices to come on the network, then
# immediately plays their entrance music and adds them to the collection
# so they won't be triggered again.
#
# A cron job restarts the daemon every night at 3:00am so the devices
# collection is reset and people are triggered again once they walk in
# the building.

module Walkon
  class Daemon
    attr_accessor :devices

    def initialize
      @devices = []
    end

    def self.start
      new.run
    end

    def run
      loop { check_for_devices }
    end

    def check_for_devices
      scanned_devices.each do |mac_address|
        unless self.devices.include? mac_address
          device = Device.new mac_address
          device.entrance_music.play if device.has_entrance_music?
          self.devices << Device.new(mac_address)
        end
      end
    end

    private
    def scanned_devices
      HciTool.scan
    end
  end
end
