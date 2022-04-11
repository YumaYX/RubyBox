#!/usr/bin/env ruby
require './lib/Y6'


puts Y3.banner "Y3"


puts Y6.ancestors


class YClass
  include Y6
  def y_def
  	banner "from y_def of YClass", 6
  end
end

y = YClass.new
puts y.y_def
