#!/bin/sh

echo "## Keys\n"
cat vimrc | grep '" key ' | sed 's/ *" key\(.*\)$/-\1/'

echo "\n## Commands\n"
cat vimrc | grep '" cmd ' | sed 's/ *" cmd\(.*\)$/-\1/'
