#!/bin/bash

# This script will move data files from TTWCS to AM using scp/rsync
# It will first clear the local cache and reaper_cache folders
# It will then transfer the files from TTWCS to here, then from here to AM reaper_cache

# Location of local cache
CACHE="/home/jenkins/WinShare"

# Location of REAPER cache
# Note the ATRT version in the path, so path may change with new zip file ...
AM_DATA="C:\\Users\\ttwcs\\Programs\\ATRT_AM_4.37.3\\RELEASE\\src\\analysis\\analysis.product\\target\\products\\com.idtus.atrt.analysis.all-rest\\win32\\win32\\x86_64\\reaper_cache\\etl\\local\\Tomahawk\\data"

# TTWCS DX data locations
# Data files may be in one of the following locations
# Sometimes they dont get moved to archive after a run, so first need
# to check "current", if no files are there, then grab from "archive"
TTWCS_CURR="/h/data/local/CSDX/data/dx_files/current/MM"
TTWCS_ARCH="/h/data/local/CSDX/data/dx_files/archive/MM"


# Read config settings
#source ./readConfig.sh

# Clear local/reaper_cache
# Use IP address only from AM ip:port
resp="$( ssh ttwcs@10.1.1.62 "del /Q ${AM_DATA}" )"
rm -f "${CACHE}"/*.d1
echo "Cache cleared ..."
