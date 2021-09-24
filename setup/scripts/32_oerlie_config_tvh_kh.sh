#!/bin/bash
# Datei: 32_oerlie_config_tvh_kh.sh
# Stand: 26.09.2021
# Inhalt: TvHeadend IPTV Installation vorbereiten, Konfigurationsdateien bereitstellen
#-----------------------------------------------------------------------
set +x

echo "----------------------------------------------------------------------------------------------------"
echo " IPTV Config preparation"
echo "----------------------------------------------------------------------------------------------------"

set -x

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

rm kn-pipe-tv
rm kn-pipe-tv-adapted
rm kn-pipe-tv-adapted-one-line
rm kn-pipe-tv-adapted-one-line-sorted
rm sort-sed
rm sort-sed-clean
rm ~/downloads/oerlie/iptv/kn-pipe-tv-adapted-sorted
mv kn-pipe-tv-adapted-sorted ~/downloads/oerlie/iptv/kn-pipe-tv-adapted-sorted

set +x

echo "----------------------------------------------------------------------------------------------------"
echo "Die nachfolgenden Aktionen auf werden im Browser auf der Tvheadend-Konfigurationsseite durchgeführt"
echo "----------------------------------------------------------------------------------------------------"
echo " TvHeadhend Server konfigurieren: http://oerlie:9981"
echo " Configuration > General > Base > Server section > User interface level > Expert"
echo " Configuration > General > Base > Start wizard"
echo "   Fenster 'Welcome - Tvheadend - your ...' : Web interface > Language > English"
echo "   Fenster 'Welcome - Tvheadend - your ...' : EPG Language (priority order) > Language 1 > German" 
echo "   Fenster 'Welcome - Tvheadend - your ...' : EPG Language (priority order) > Language 2 > English" 
echo "   Fenster 'Welcome - Tvheadend - your ...' : EPG Language (priority order) > Language 3 > French"
echo "   Fenster 'Welcome - Tvheadend - your ...' : Network access, Administrator login, User login > bleiben leer"
echo "   Fenster 'Network Settings' : 'Network 1' : Tuner > IPTV ; Network type > IPTV Automatic Network"
echo "   Fenster 'Network Settings' : 'Network 2' : Tuner > [Sony CXD2880 ...|...|...] ; Network type > DVB-T Network"
echo "   Fenster 'Assign predefined muxes to networks' : 'Network 1': Network: DVB-T Network;  Pre-defined muxes : Germany: de-generic-all-channels"
echo "   Fenster 'Assign predefined muxes to networks' : 'Network 2': Network: IPTV Automatic Network;  URL : file:///storage/downloads/oerlie/iptv/kn-pipe-tv-adapted-sorted"
echo "   --> Als Ergebnis erscheint z.B. 'Found muxes 259'; 'Found services 155'"
echo "   Fenster 'Service mapping' : Map all services; Create provider tags; Create network tags"
echo "   Configuration > DVB Inputs > Networks > IPTV Automatc Network > Edit > Channel numbers from 101 > Save"
