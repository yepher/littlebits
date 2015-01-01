#!/bin/bash

########
# Run this script to reset app back to all the default settings.
#
# Warning:
# Once you run this script you will have to add your API token again
#
######

# remove preferences file (which could be stored in ~/Library/Preferences/)
defaults delete com.yepher.LittleBits

# directory below is for sandboxed app
rm -rf ~/Library/Containers/com.yepher.LittleBits

# This is non sandboxed apps
rm -rf  ~/Library/Application\ Support/com.yepher.LittleBits

# Cause preferences to be reloaded
killall -SIGTERM cfprefsd




