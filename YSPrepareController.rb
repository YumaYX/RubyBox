#!/usr/bin/env ruby
require 'fileutils'
require_relative './lib/Y6'


unless ARGV.length == 1
  Y3.banner 'ERROR:'
  Y3.banner "ruby #{__FILE__} [ControllerName]"
  exit 255
end


controller_name = File.basename(ARGV[0].chmop, '.*')
Y3.info "making controller for #{controller_name}"

if File.exist?(controller_name + '.rb')
  Y3.banner 'ERROR:'
  Y3.banner "#{controller_name}.rb is already exist."
  exit 255
end

template_dir = 'lib/template/'

['data', 'op'].each do |sub_directory|
  new_dir = sub_directory + '/' + controller_name
  Y3.info "mkdir #{new_dir}"
  FileUtils.mkdir_p(new_dir)

  if sub_directory.eql?('data') then
    config = ERB.new(File.read(template_dir + '/YSConfig.json.erb' )).result(binding)
    Y3.file_writer(new_dir + '/config.json' ,config)
  end
end


controller = ERB.new(File.read(template_dir + '/YSTemplate.rb.erb' )).result(binding)
Y3.file_writer("./#{controller_name}.rb" ,controller)

exit 0