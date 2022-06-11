#!/usr/bin/env ruby
require 'fileutils'
require_relative './lib/Y6'

unless ARGV.length == 1
  Y3.banner 'ERROR:'
  Y3.banner "ruby #{__FILE__} [Lib Name]"
  exit 255
end

lib_name = File.basename(ARGV[0].chomp, '.*')
Y3.info "making lib and test files for #{lib_name}"

if File.exist?('./lib/' + lib_name + '.rb')
  Y3.banner 'ERROR:'
  Y3.banner './lib/' + "#{lib_name}.rb is already exist."
  exit 255
end

template_dir = 'lib/template/'

test_file = ERB.new(File.read(template_dir + '/YSTestTemplate.rb.erb' )).result(binding)
Y3.file_writer("./test/#{lib_name}Test.rb" ,test_file)

Y3.file_writer("./lib/#{lib_name}.rb" ,'')


exit 0