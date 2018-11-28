#!/usr/bin/env bash

. .env

OUTPUT="$HOME/.atom"
mkdir -p "$OUTPUT"

# Run the template through sed as a lazy templating language, and output to the final ~/.atom/config.cson location
cat "./config/config.cson" | \
sed -e "s/{{ FONT }}/$FONT/g" | \
sed -e "s/{{ USERID }}/$USERID/g" \
> "$OUTPUT/config.cson"

echo ":: $OUTPUT/config.cson"

files=("keymap.cson" "snippets.cson" "styles.less")
for f in "${files[@]}"; do
	cp "./config/$f" "$OUTPUT/$f"
	echo ":: $OUTPUT/$f"
done
