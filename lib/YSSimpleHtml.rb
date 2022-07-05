#!/usr/bin/env ruby
require_relative 'Y6'

# TODO
c = String.new Y3.make_erbfile_string(Y3::TEMPLATE_DIR + '/YSSimpleHtmlHeader.html.erb')
c << '<h1>Hello!</h1>'
c << '</body></html>'

# OUTPUT
Y3.file_writer(Y3::OP_DIR + '/index.html', c)
Y3.info Y3::OP_DIR + '/index.html'