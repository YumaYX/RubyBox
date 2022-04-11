#!/usr/bin/env ruby

require 'redcarpet'
require './lib/Y3'

module Y6

  include Y3

  class << self

    # make html form markdown file
    # @param [String] markdown file name(Location)
    # @return [String] html
    def markdown_file_2_html(filename = '')
      return nil unless File.exist?(filename)
      rawdata = ''
      File.open(filename, 'r') do |markdown_file|
        markdown_file.each_line do |line|
          rawdata = rawdata + line
        end
      end
      markdown_2_html(rawdata).gsub(/[\n]+/,"\n")
    end

    # make html form markdown
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

  end
end
