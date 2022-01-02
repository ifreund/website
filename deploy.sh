#!/bin/sh

target=$1
if [ -z "$target" ]; then
	echo "argument required: target directory"
	exit 1
fi

rm -r public
hugo || exit 1
rm -r "${target}"/*
cp -r public/* "${target}"
git -C "${target}" commit -am "Regenerate website"
