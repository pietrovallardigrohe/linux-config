#!/bin/bash

get_platform() {
  platform=$(uname -s)

  if [ $platform = "Darwin" ];
  then
    platform="MacOs"
  fi

  return platform
}

echo $(get_platform)
