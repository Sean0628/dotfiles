#!/usr/bin/env sh

export EXTENSIONS_FILE="$HOME/dotfiles/vscode/extensions.txt"

cat "$EXTENSIONS_FILE" | while read line
do
  code --install-extension "$line"
done

code --list-extensions > "$EXTENSIONS_FILE"
