oerlie - oeffentlich rechtlicher linux empfänger

standard libreelc/kodi configuration for reception of German public TV stations via DVB-T2 and IPTV 

This repository consists of
- files/templates for libreelec/kodi/tvheadend configuration
- especially working/current configurations for tvheadend dvb-t2 and iptv
- "how to" descriptions


Proceed as follows:

# remote login on Raspberry PI / Libreelec via ssh
ssh root@oerlie-kh

# create download and oerlie configuration directory if not exist
rm -r ~/downloads/oerlie/

rm oerlie.tar.gz

mkdir ~/downloads

mkdir ~/downloads/oerlie

# change into download repository
cd /storage/downloads

# fetch compressed files from github, unpack and change to scipts directory
wget https://github.com/melibokus-h2/oerlie/raw/develop/setup/oerlie.tar.gz

cd /storage/downloads/oerlie

tar xfv /storage/downloads/oerlie.tar.gz

cd scripts

# read or/and execute scipts
(sh ./21_oerlie_sd_installaton)
more 22_oerlie_libreelec_kodi_installation
sh ./31_oerlie_prog_sorted
sh ./32_oerlie_config_tvh_clear_init


