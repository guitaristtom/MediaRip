# MediaRip

A bash script to allow the automatic ripping of media such as DVDs, BluRay discs, music discs, etc.

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
