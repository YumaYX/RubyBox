#!/usr/bin/env ruby

require 'redcarpet'

module YSMod2
  class << self
    def YSMarkdown_file_2_html(filename = '')
      return nil unless File.exist?(filename)
      rawdata = ''
      File.open(filename, 'r') do |markdown_file|
        markdown_file.each_line do |line|
          rawdata = rawdata + line
        end
      end
      YSMarkdown_2_html(rawdata).gsub(/[\n]+/,"\n")
    end

    def YSMarkdown_2_html(md)
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
