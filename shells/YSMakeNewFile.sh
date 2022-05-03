#!/bin/sh

# sh shells/YSMakeNewFile.sh FileName

if [ ${#} -ne 1 ]; then
	echo "ERROR: Argument Error\nTerminated."; exit 254
fi

filename="${1%.rb}"
filepath="./lib/${filename}.rb"

if [ -e "${filepath}" ]; then
  echo "File exists.\nTerminated."; exit 255
fi

touch "${filepath}"

test_filename="${filename}Test.rb"

cat <<EOF > ./test/"${test_filename}"
require 'minitest/autorun'
require_relative '../lib/${filename}'

class ${test_filename%.rb} < Minitest::Test

end
EOF

ls -1 ./*/*${filename}*