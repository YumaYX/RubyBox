#!/usr/bin/env ruby

require 'json'

module YSMod
  class << self
    # make JSON File to ruby's Hash
    # @param [String] JSON file name(Location)
    # @return [Hash]
    def YSExtract_json_2_hash(jsonfile = '')
      hash = {}
      File.open(jsonfile) do |j|
        hash = JSON.load(j)
      end
      hash
    end

    # make Text File to ruby's Array
    # @param [String] File name(Location)
    # @return [Array]
    def YSExtract_json_2_array(textfile = '')
      arr = []
      File.foreach(textfile) do |line|
        arr.push line.chomp
      end
      arr
    end

    # display banner message
    # @param [String] message
    # @param [Integer] '#' length
    # @return [String]
    def YSBanner(str = '', length = 40)
      '#' * length + ' ' + str
    end
  end
end
