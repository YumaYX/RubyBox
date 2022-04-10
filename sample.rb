#!/usr/bin/env ruby
require './lib/YSDef'

require './lib/YSMod'
puts YSMod.YSBanner("add Module", 10)
puts YSMod.methods.select { |element| element =~ /^YS/ }

require './lib/YSMod2'
puts YSMod.YSBanner("add Module2", 10)
puts YSMod2.methods.select { |element| element =~ /^YS/ }