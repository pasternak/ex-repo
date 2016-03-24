#!/usr/bin/env bash

RESOPONSES=()
for i in {1..10}
do
  RESPONSES+=("$(curl -sL http://192.168.50.4/)")
done

printf "%s\n" "${RESPONSES[@]}" | sort -u

