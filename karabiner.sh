#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

private=~/Library/Application\ Support/Karabiner/private.xml
cp karabiner_private.xml $private

$cli reloadxml

$cli set repeat.wait 33
/bin/echo -n .
$cli set poker3.escape_backquote 1
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
/bin/echo
