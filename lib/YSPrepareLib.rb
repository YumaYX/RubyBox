#!/usr/bin/env ruby
require 'fileutils'
require_relative 'Y6'

unless ARGV.length == 1
  Y3.banner 'ERROR:'
  Y3.banner "ruby #{__FILE__} [Lib Name]"
  exit 255
end

lib_name = File.basename(ARGV[0].chomp, '.*')
Y3.info "making lib and test files for #{lib_name}"

if File.exist?(Y3::LIB_DIR + '/' + lib_name + '.rb')
  Y3.banner 'ERROR:'
  Y3.banner Y3::LIB_DIR + "/#{lib_name}.rb is already exist."
  exit 255
end

test_file = ERB.new(File.read(Y3::TEMPLATE_DIR + '/YSTestTemplate.rb.erb' )).result(binding)
Y3.file_writer(Y3::TEST_DIR + "/#{lib_name}Test.rb", test_file)

Y3.file_writer(Y3::LIB_DIR + "/#{lib_name}.rb", '')


exit 0
