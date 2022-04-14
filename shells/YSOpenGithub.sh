#!/bin/zsh

which open > /dev/null \
	&& open 'https://github.com/YumaYX/RubyBox' \
	|| echo "COMMAND NOT FOUND: 'open'"