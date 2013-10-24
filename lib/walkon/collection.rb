require 'enumerable'

module Walkon
  class Collection
    include Enumerable

    def initialize from_devices=[]
      @devices = from_devices
    end

    def each
      @devices.each { |device| yield device }
    end
  end
end
