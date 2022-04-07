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

    # make Array before pattern
    # @param [Array] Target Array
    # @param [String] Pattern String
    # @return [Array]
    def YSExtract_array_before_include(target_array, pattern)
      YSExtract_array_befaft_include(target_array, pattern, 'before')
    end

    # make Array after pattern
    # @param [Array] Target Array
    # @param [String] Pattern String
    # @return [Array]
    def YSExtract_array_after_include(target_array, pattern)
      YSExtract_array_befaft_include(target_array, pattern, 'after')
    end


    private

    # make Array before/after pattern
    # @param [Array] Target Array
    # @param [String] Pattern String
    # @param [String] after or not
    # @return [Array]
    def YSExtract_array_befaft_include(target_array,pattern,befaft)
      index = nil
      target_array.each_with_index do |element, i|
        if element =~ /#{pattern}/
          index = i
          break
        end
      end
      array = target_array.dup
      return array if index.nil?
      if (befaft.eql? 'after')
        array.shift(index)
      else
        array.pop(target_array.length - index -1)
      end
      array
    end
    
  end

end
