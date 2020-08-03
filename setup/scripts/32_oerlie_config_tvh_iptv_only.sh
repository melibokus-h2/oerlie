#!/bin/bash
# Datei: 32_oerlie_config_tvh_clear_init.sh
# Stand: 01.02.2020
# Inhalt: TvHeadend Installation vorbereiten, Konfigurationsdateien bereitstellen
#-----------------------------------------------------------------------

set +x

echo "----------------------------------------------------------------------------------------------------"
echo " IPTV Config preparation"
echo "----------------------------------------------------------------------------------------------------"

set -x

# https://github.com/jnk22/kodinerds-iptv
wget bit.ly/kn-pipe-tv
ls -lat
sed s/usr/'storage\/.kodi\/addons\/tools.ffmpeg-tools'/g kn-pipe-tv >kn-pipe-tv-adapted
ls -lat
sed '1n;N;s/\n/;/g' kn-pipe-tv-adapted >kn-pipe-tv-adapted-one-line
ls -lat
sed "s/^/sed \-ne \'\/\"/;s/$/\"\/p\' kn\-pipe\-tv\-adapted\-one\-line \>\>kn\-pipe\-tv\-adapted\-one\-line\-sorted/" 31_oerlie_prog-sorted-kh >sort-sed
ls -lat
sed 's/ \/ / \\\/ /g' sort-sed > sort-sed-clean
ls -lat
echo "#EXTM3U" >kn-pipe-tv-adapted-one-line-sorted
ls -lat
sh sort-sed-clean
ls -lat
sed 's/;pipe/\npipe/g' kn-pipe-tv-adapted-one-line-sorted >kn-pipe-tv-adapted-sorted
ls -lat

