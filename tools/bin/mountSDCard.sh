#!/bin/bash

DIRECTORY=/Volumes/little
SDCARD=/dev/disk1s3

if [ ! -b "$SDCARD" ]; then
    echo "ERROR: SD card not found. $SDCARD"
    exit -1
fi

echo "Found $SDCARD"

if [ ! -d "${DIRECTORY}" ]; then
  echo "Creating:  $DIRECTORY"
  mkdir ${DIRECTORY}
fi

sudo fuse-ext2 -o force $SDCARD $DIRECTORY

open $DIRECTORY
