#!/bin/sh

target=$1
if [ -z "$target" ]; then
	echo "argument required: target directory"
	exit 1
fi

rm -r public
hugo || exit 1
mkdir -p public/goatcounter
curl https://gc.zgo.at/count.js > public/goatcounter/count.js

rm -r "${target}"/*
cp -r public/* "${target}"
git -C "${target}" add -A
git -C "${target}" commit -m "Regenerate website"
