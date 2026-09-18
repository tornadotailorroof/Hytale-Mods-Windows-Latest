#!/bin/sh

TARGET="${1:-.}"

echo "Directory Report"
echo "================"
echo "Target: $TARGET"
echo

file_count=$(find "$TARGET" -type f 2>/dev/null | wc -l)
dir_count=$(find "$TARGET" -type d 2>/dev/null | wc -l)
txt_count=$(find "$TARGET" -type f -name "*.txt" 2>/dev/null | wc -l)
log_count=$(find "$TARGET" -type f -name "*.log" 2>/dev/null | wc -l)

echo "Files: $file_count"
echo "Directories: $dir_count"
echo "Text Files: $txt_count"
echo "Log Files: $log_count"

echo
echo "Recent Files"
echo "------------"

find "$TARGET" -type f -printf "%T@ %p\n" 2>/dev/null |
    sort -nr |
    head -n 10 |
    cut -d' ' -f2-

echo
echo "Disk Usage"
echo "----------"

du -sh "$TARGET" 2>/dev/null

echo
echo "Report completed."