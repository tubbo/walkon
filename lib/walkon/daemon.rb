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

    private
    def check_for_devices
      @devices = scanned_device_ess_ids.reject { |ess_id|
        devices.include? ess_id
      }.map { |ess_id|
        Device.play! ess_id
      }
    end

    def scanned_device_ess_ids
      HciTool.scan
    end
  end
end
