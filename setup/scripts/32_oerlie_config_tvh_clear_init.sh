#!/bin/bash
# Datei: 32_oerlie_config_tvh_clear_init.sh
# Stand: 03.08.2020
# Inhalt: TvHeadend Installation vorbereiten, Konfigurationsdateien bereitstellen
#-----------------------------------------------------------------------
set -x

cp 31_oerlie_my_stations.json /storage/.kodi/userdata/addon_data/plugin.audio.radio_de/.storage/my_stations.json

set +x

echo "----------------------------------------------------------------------------------------------------"
echo " DVB-T2 Config preparation"
echo "----------------------------------------------------------------------------------------------------"

set -x

tvheadendconfigpath="/storage/.kodi/userdata/addon_data/service.tvheadend42/"
piconpath="/storage/picons"
piconpathtvh="/storage/picons/tvh/"
piconpathvdr="/storage/picons/vdr/"


ls -la $piconpathtvh
ls -la $piconpathvdr
ls -la $tvheadendconfigpath

mkdir $piconpath
mkdir $piconpathtvh
mkdir $piconpathvdr

rm $piconpathtvh*
rm $piconpathvdr*
rm -r $tvheadendconfigpath*

ls -la $piconpathtvh
ls -la $piconpathvdr
ls -la $tvheadendconfigpath

ps -ef|grep tvheadend
pkill tvheadend
sleep 15
ps -ef|grep tvheadend

dvbtscantabspath="/storage/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t"
ls -la $dvbtscantabspath/de*
rm $dvbtscantabspath/de*
cp /storage/oerlie/dvbt/de* $dvbtscantabspath
ls -la $dvbtscantabspath/de*

ps -ef|grep tvheadend
pkill tvheadend
sleep 15
ps -ef|grep tvheadend

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
sed "s/^/sed \-ne \'\/\"/;s/$/\"\/p\' kn\-pipe\-tv\-adapted\-one\-line \>\>kn\-pipe\-tv\-adapted\-one\-line\-sorted/" 31_oerlie_prog-sorted >sort-sed
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
mv kn-pipe-tv-adapted-sorted /storage/oerlie/iptv

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
echo "   Fenster 'Assign predefined muxes to networks' : 'Network 2': Network: IPTV Automatic Network;  URL : file:///storage/oerlie/iptv/kn-pipe-tv-adapted-sorted"
echo "   --> Als Ergebnis erscheint z.B. 'Found muxes 259'; 'Found services 155'"
echo "   Fenster 'Service mapping' : Map all services; Create provider tags; Create network tags"
echo "   Configuration > DVB Inputs > Networks > IPTV Automatc Network > Edit > Channel numbers from 101 > Save"

echo "Konfiguration hier fortsetzen? (ja/nein):"
read unterbrechung

if $unterbrechung == "ja" 
then
	echo "------------------------------------------------------------------------------------------------------------"   
	echo " Danach 33_oerlie_config"
	echo "------------------------------------------------------------------------------------------------------------"
else
fi
