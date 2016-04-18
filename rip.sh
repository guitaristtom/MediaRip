#!/bin/bash

USER_HOME="$(eval echo ~${SUDO_USER})"
STORAGE_DIR="${USER_HOME}/rips" # Location to store Vobs
MOVIES_DIR="${STORAGE_DIR}/movies" # Location to place encoded videos
TMP_DIR="${STORAGE_DIR}/tmp" # Location to store vobs
LOCK_FILE="${STORAGE_DIR}/rip.lock" # Lock File

DRIVE_DIR="/media/cdrom" # Mount location of dvd
DRIVE_DEV="/dev/sr0" # DVD Device


# Only run if not already running
if [ -f "${LOCK_FILE}" ]; then
   echo "*** Lock file present"
   exit 3
fi

touch "${LOCK_FILE}"

mount | grep "${DRIVE_DIR}" || mount "${DRIVE_DEV}" "${DRIVE_DIR}"
if [ $? -ne 0 ]; then
   # dvd not mounted
   echo "*** DVD not mounted"
   rm "${LOCK_FILE}"
   exit 4
fi

sleep 15;

if [ ! -d "${DRIVE_DIR}/VIDEO_TS" ]; then
   # not a video dvd?
   echo "*** VIDEO_TS directory not present"
   rm "${LOCK_FILE}"
   exit 5
fi


DVD_NAME="$(vobcopy -I 2>&1 > /dev/stdout | grep DVD-name | sed -e 's/.*DVD-name: //')"

vobcopy -m -f -o"${TMP_DIR}" -i "${DRIVE_DIR}"
if [ $? -ne 0 ]; then
   # vobcopy failed1
   echo "*** Error during vob copy" 
   rm -rf "${TMP_DIR}/${DVD_NAME}"
   rm "${LOCK_FILE}"
   exit 1
fi

ATV2_NAME="${DVD_NAME}"
INC=""
while [ -f "${MOVIES_DIR}/${ATV2_NAME}${INC}.mp4" ]; do ((INC=INC+1)); done;
if [ -n "${INC}" ]; then MP4_NAME="${ATV2_NAME}${INC}"; fi

HandBrakeCLI -v -i "${TMP_DIR}/${DVD_NAME}/" -o "${MOVIES_DIR}/${ATV2_NAME}.mp4" --preset="AppleTV 2" 
if [ $? -ne 0 ]; then
   # encoding failed
   echo "*** Error during encoding"
   rm -rf "${TMP_DIR}/${DVD_NAME}"
   rm "${MOVIES_DIR}/${MP4_NAME}.mp4"
   rm "${LOCK_FILE}"
   exit 2
fi

rm -rf "${TMP_DIR}/${DVD_NAME}"

umount "${DRIVE_DIR}" && eject "${DRIVE_DEV}"

rm "${LOCK_FILE}"

echo "Rip of ${DVD_NAME} completed.\nEncoded to ${MOVIES_DIR}/${MP4_NAME}.mp4"
