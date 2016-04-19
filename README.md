# MediaRip

A bash script to allow the automatic ripping of media such as DVDs, BluRay discs, music discs, etc.

This script was originally posted on Ars Technica [(Click here)](http://arstechnica.com/civis/viewtopic.php?t=1137975) and has since been heavily modified.

# Required Packages for this to work:
* vobcopy
* HandBrakeCLI

# Folders to MKDIR
* ~/rips (a folder called "rips" in your home folder)
* ~/rips/tmp (a temporary folder in the rips folder)
* ~/rips/movies (a temporary folder in the rips folder)

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

HandBrakeCLI -v -i "/home/thomas/rips/tmp/MINDSTORM" -o "/home/thomas/rips/movies/MINDSTORM.mp4" -e x264 -q 20 -E ffaac