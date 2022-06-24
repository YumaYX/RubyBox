#!/usr/bin/env ruby

require 'json'
require 'csv'
require 'erb'
require 'digest'

module Y3

  DTDIR   = File.expand_path('../../data/', __FILE__)
  LIBDIR  = File.expand_path('../',         __FILE__)
  OPDIR   = File.expand_path('../../op/',   __FILE__)
  TESTDIR = File.expand_path('../../test/', __FILE__)

  class << self

    # Display Information Template Message
    # @param [String] message
    def info(message = '')
      puts "[INFO]: #{message}"
    end

    # Display Warning Template Message
    # @param [String] message
    def warn(message = '')
      puts "[WARN]: #{message}"
    end

    # display banner message
    # @param [String] message
    # @param [Integer] '#' length
    def banner(message = '', hash_mark_length = 40)
      puts '#' * hash_mark_length + ' ' + message
    end

    #########################

    # Make JSON File to Ruby's Hash
    # @param  [String] JSON file name(Location)
    # @return [Hash]
    def extract_json_file_2_hash(json_file = '')
      File.open(json_file) do |j|
        JSON.load(j)
      end
    end
    alias_method :make_jsonfile_hash, :extract_json_file_2_hash

    # Make Text File to Ruby's Array
    # @param  [String] File name(Location)
    # @return [Array]
    def extract_text_file_2_array(text_file = '')
      file_contents = []
      File.foreach(text_file) do |text_file_line|
        file_contents.push text_file_line.chomp
      end
      file_contents
    end
    alias_method :make_textfile_array, :extract_text_file_2_array

    # make CSV File to Ruby's Array
    # @param  [String] CSV File name(Location)
    # @return [Array]
    def extract_csv_file_2_array(csv_file = '')
      CSV.read(csv_file)
    end
    alias_method :make_csvfile_array, :extract_csv_file_2_array

    # Make ERB File to Ruby's String
    # @param  [String] File Name
    # @return [String] Generated Content
    def make_erbfile_string(erb_file = '')
      ERB.new(File.read(erb_file)).result(binding)
    end

    #########################

    # Make Count Apprearance Frequency
    # @param  [Array] Array(string)
    # @return [Hash] count apprearance frequency hash with symbol
    def count_appearance_frequency(target_array)
      frequency_hash = Hash.new(0)
      target_array.each do |element|
        frequency_hash[element.to_sym] += 1
      end
      frequency_hash
    end

    #########################

    # Make New File 
    # @param [String] Output File Name
    # @param [String] File content
    def file_writer(file_name, contents = '')
      File.write(file_name, contents)
    end
    
  end

end
