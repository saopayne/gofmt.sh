#!/usr/bin/sh
gofiles=$(find . -name "*.go")
[ -z "$gofiles" ] && exit 0 #-z means true if string is empty

unformatted=$(gofmt -l $gofiles)
[ -z "$unformatted" ] && exit 0 #so if var is empty, let's quit

# Some files are not gofmt'd. Print message and fail.

echo >&2 "Formatting go files..."
for fn in $unformatted; do
  echo "   gofmt -w $PWD/$fn"
        gofmt -w $PWD/$fn
done

exit 1
