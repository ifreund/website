#!/bin/sh

target=$1
if [ -z "$target" ]; then
	echo "argument required: target directory"
	exit 1
fi

rm -r out
bag index.janet || exit 1

rm -r "${target}"/*
cp -r out/* "${target}"
git -C "${target}" add -A
git -C "${target}" commit -m "Regenerate website"
