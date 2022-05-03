#!/usr/bin/env ruby

require 'redcarpet'
require 'digest/sha2'
require_relative 'Y3'

module Y6

  class << self

    # make html from markdown file
    # @param [String] markdown file name(Location)
    # @return [String] html
    def markdown_file_2_html(filename = '')
      return nil unless File.exist?(filename)
      rawdata = ''
      File.open(filename, 'r') do |markdown_file|
        markdown_file.each_line do |line|
          rawdata << line
        end
      end
      markdown_2_html(rawdata).gsub(/[\n]+/,"\n")
    end

    # make html from markdown
    # @param [String] markdown
    # @return [String] html
    def markdown_2_html(md)
      data = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML,
        tables: true,
        autolink: true,
        fenced_code_blocks: true,
        lax_spacing: true,
        space_after_headers: true
      )
      data.render(md)
    end

    # make SHA256 Digest
    # @param [String] String
    # @return [String] SHA256 Hex Digest
    def get_sha256(target='')
      Digest::SHA256.hexdigest(target)
    end

  end
end
