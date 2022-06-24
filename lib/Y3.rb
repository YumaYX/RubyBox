#!/usr/bin/env ruby

require 'json'
require 'csv'
require 'erb'
require 'digest'

module Y3

  # lib dir
  LIBDIR = File.expand_path('../', __FILE__)
  # test dir
  TESTDIR = File.expand_path('../../test', __FILE__)

  class << self

    # display information template
    # @param [String] message
    def info(message)
      puts "[INFO]: #{message}"
    end

    # display warning template
    # @param [String] message
    def warn(message)
      puts "[WARN]: #{message}"
    end

    # display banner message
    # @param [String] message
    # @param [Integer] '#' length
    # @return [String]
    def banner(str = '', length = 40)
      puts '#' * length + ' ' + str
    end
    
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

    # Convert ERB File to String
    # @param [String] File Name
    # @return [String] Generated Content
    def erb_2_string(filename='')
      ERB.new(File.read(filename)).result(binding)
    end

    # Make New File
    # @param [String] Output File Name
    # @param [String] File content
    def file_writer(filename,content)
      File.write(filename, content)
    end
    
  end

end
