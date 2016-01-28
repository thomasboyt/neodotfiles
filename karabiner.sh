#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

# if I had private keybindings, I could do:
# private=~/Library/Application\ Support/Karabiner/private.xml
# cp karabiner_private.xml $private

$cli set repeat.wait 33
/bin/echo -n .
$cli set remap.escape2backquote 1
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
/bin/echo
