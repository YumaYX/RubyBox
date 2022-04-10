#!/bin/zsh

TARGET=README.md
rdoc --main ${TARGET} --exclude shells --exclude test
