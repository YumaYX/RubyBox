#!/usr/bin/env ruby

require 'json'
require 'csv'

module Y3
  class << self
    # make JSON File to ruby's Hash
    # @param [String] JSON file name(Location)
    # @return [Hash]
    def extract_json_file_2_hash(jsonfile = '')
      hash = {}
      File.open(jsonfile) do |j|
        hash = JSON.load(j)
      end
      hash
    end

    # make Text File to ruby's Array
    # @param [String] File name(Location)
    # @return [Array]
    def extract_text_file_2_array(textfile = '')
      arr = []
      File.foreach(textfile) do |line|
        arr.push line.chomp
      end
      arr
    end

    # make CSV File to ruby's Array
    # @param [String] CSV File name(Location)
    # @return [Array]
    def extract_csv_file_2_array(csvfile = '')
      CSV.read(csvfile)
    end

    # display banner message
    # @param [String] message
    # @param [Integer] '#' length
    # @return [String]
    def banner(str = '', length = 40)
      '#' * length + ' ' + str
    end

    # make Array before pattern
    # @param [Array] Target Array
    # @param [String] Pattern String
    # @return [Array]
    def extract_array_before_include(target_array, pattern)
      extract_array_befaft_include(target_array, pattern, 'before')
    end

    # make Array after pattern
    # @param [Array] Target Array
    # @param [String] Pattern String
    # @return [Array]
    def extract_array_after_include(target_array, pattern)
      extract_array_befaft_include(target_array, pattern, 'after')
    end

    # make Array with [INCLUDE] tag if patterns include
    # @param [Array] Target Array(Strings)
    # @param [Array] Pattern Strings
    # @return [Array]
    def compare_arrays(array, pattern)
      outcome = []
      prefix = "[INCLUDE] "
      array.each do |element|
        if pattern.include?(element)
          outcome.push (prefix + element)
        else
          outcome.push element
        end
      end
      outcome
    end


    # make Array with range
    # @param [Array] Target Array(Strings)
    # @param [Array] START Pattern Strings
    # @param [Array] END Pattern Strings
    # @return [Array]
    def extract_line_range(target_array=[], start_str='', end_str='')
      array = []
      target_array.each do |element|
        next unless element =~ /#{start_str}/ .. element =~ /#{end_str}/
        array.push element
      end
      array
    end

    # make time difference
    # @param [DateTime]
    # @param [DateTime]
    # @return [String]
    def calc_time_diff(date1, date2)
      diff = date2 - date1
      hdiff = ( diff * 24).to_i
      mdiff = ((diff * 24 * 60) % 60).to_i
      "#{hdiff}:#{mdiff}"
    end

    # make count apprearance frequency(hash)
    # @param [Array] Array(string)
    # @return [Hash] count apprearance frequency hash with symbol
    def count_appearance_frequency(array)
      hash = Hash.new(0)
      array.each do |element|
        hash[element.to_sym]+=1
      end
      hash
    end

    private

    # make Array before/after pattern
    # @param [Array] Target Array
    # @param [String] Pattern String
    # @param [String] after or not
    # @return [Array]
    def extract_array_befaft_include(target_array,pattern,befaft)
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
