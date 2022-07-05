#!/usr/bin/env ruby
require 'fileutils'
require_relative 'Y6'


unless ARGV.length == 1
  Y3.banner 'ERROR:'
  Y3.banner "ruby #{__FILE__} [ControllerName]"
  exit 255
end


controller_name = File.basename(ARGV[0].chomp, '.*')
Y3.info "making controller for #{controller_name}"
Y3.info "touch #{Y3::LIB_DIR}/#{controller_name}.rb"

if File.exist?(controller_name + '.rb')
  Y3.banner 'ERROR:'
  Y3.banner "#{controller_name}.rb is already exist."
  exit 255
end

['data', 'op'].each do |sub_directory|
  new_dir = sub_directory + '/' + controller_name
  Y3.info "mkdir #{new_dir}"
  FileUtils.mkdir_p(new_dir)

  if sub_directory.eql?('data') then
    config = ERB.new(File.read(Y3::TEMPLATE_DIR + '/YSConfig.json.erb' )).result(binding)
    Y3.file_writer(new_dir + '/config.json' ,config)
  end
end


controller = ERB.new(File.read(Y3::TEMPLATE_DIR + '/YSTemplate.rb.erb' )).result(binding)
Y3.file_writer(Y3::LIB_DIR + "/#{controller_name}.rb" ,controller)

exit 0
