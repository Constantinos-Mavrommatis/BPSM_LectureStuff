#!/usr/bin/bash

File_name=$(cat Tco2.fqfiles | awk 'BEGIN{FS="\t";}{print $1;}' | grep "Tco")

echo -e "${File_name}"













