#!/usr/bin/env ruby
require_relative './lib/Y6'

# Config
CONFIG = Y3.extract_json_file_2_hash('data/YSSimpleHtml/config.json')

# TODO
c = String.new Y3.erb_2_string(CONFIG["TPDIR"] + 'YSSimpleHtmlHeader.html.erb')
c << '<h1>Hello!</h1>'
c << '</body></html>'

# OUTPUT
Y3.file_writer(CONFIG['OPDIR'] + 'index.html', c)
Y3.info CONFIG['OPDIR'] + 'index.html'