oerlie
standard libreelc/kodi configuration for reception of German public TV stations via DVB-T2 and IPTV - oeffentlich rechtlicher linux empfänger

Proceed as follows:

ssh root@oerlie-kh

cd /storage/downloads
mkdir /storage/oerlie
wget https://github.com/melibokus-h2/oerlie/raw/develop/setup/oerlie.tar.gz
cd /storage/oerlie
tar xfv /storage/downloads/oerlie.tar.gzsh 
cd scripts
(sh ./21_oerlie_sd_installaton)
more ./22_librelelc_kodi_installation
sh ./31_oerlie_prog_sorted
sh ./32_oerlie_config_tvh_clear_init

This repository consists of
- files/templates for libreelec/kodi/tvheadend configuration
- "how to" descriptions
