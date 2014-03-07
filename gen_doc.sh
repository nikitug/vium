#!/bin/sh

echo "## Keys\n"
cat `dirname $0`/vimrc | grep '" key ' | sed 's/ *" key\(.*\)$/-\1/'

echo "\n## Commands\n"
cat `dirname $0`/vimrc | grep '" cmd ' | sed 's/ *" cmd\(.*\)$/-\1/'
