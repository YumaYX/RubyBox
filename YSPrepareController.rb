#!/usr/bin/env ruby
require 'fileutils'
require_relative './lib/Y6'


unless ARGV.length == 1
  Y3.banner 'ERROR:'
  Y3.banner "ruby #{__FILE__} [ControllerName]"
  exit 255
end


controller_name = ARGV[0]
Y3.banner "making controller for #{controller_name}"


template_dir = 'lib/template/YSPrepareController'

['data', 'op'].each do |sub_directory|
  new_dir = sub_directory + '/' + controller_name
  Y3.info "mkdir #{new_dir}"
  FileUtils.mkdir_p(new_dir)

  if sub_directory.eql?('data') then
    config = ERB.new(File.read(template_dir + '/config.json.erb' )).result(binding)
    Y3.file_writer(new_dir + '/config.json' ,config)
  end
end


controller = ERB.new(File.read(template_dir + '/template.rb.erb' )).result(binding)
Y3.file_writer("./#{controller_name}.rb" ,controller)

exit 0