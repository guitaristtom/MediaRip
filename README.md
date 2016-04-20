# MediaRip

A bash script to allow the automatic ripping of media such as DVDs, BluRay discs, music discs, etc.

This script was originally posted on Ars Technica [(Click here)](http://arstechnica.com/civis/viewtopic.php?t=1137975) and has since been heavily modified.

The inspiration and help with the TV Show script can be found here: [(Click here)](http://askubuntu.com/questions/39148/rip-transcode-multiple-titles-from-a-tv-series-dvd-automatically)

# Required Packages for this to work:
* vobcopy
* libdvd-pkg
* HandBrakeCLI

# Folders to MKDIR
* ~/rips (a folder called "rips" in your home folder)
* ~/rips/temp (a temporary folder in the rips folder)
* ~/rips/movies
* ~/rips/tvshows

# How to use:
* Open your disc drive, put in your disc
* Run rip.sh as sudo (or root, depending on OS)
* Done?

# Exit Codes
1. vobcopy failed
2. encoding failed
3. lock file present
4. DVD not mounted
5. VIDEO_TS not present - probably not a video DVD

#To Do List:
* Add music CD support
* Check and work on TV Show season disc support
* Bluray disc support (if it doesn't already work)
