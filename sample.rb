#!/usr/bin/env ruby
require './lib/YSDef'

d = YSDef.new

puts d.YSbanner("Hello World!", 10)

methods = d.methods.select { |element| element =~ /^YS/ }
p methods