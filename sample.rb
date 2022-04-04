#!/usr/bin/env ruby
require './lib/YSDef'

d = YSDef.new

puts d.YSBanner("Hello World!", 10)

methods = d.methods.select { |element| element =~ /^YS/ }
p methods


require './lib/YSMod'
puts YSMod.YSBanner("add Module", 10)