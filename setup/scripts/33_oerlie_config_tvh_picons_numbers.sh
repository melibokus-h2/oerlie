#!/bin/bash
set -x
channelconfallfiles="/storage/.kodi/userdata/addon_data/service.tvheadend42/channel/config/*"
piconpathtvh="/storage/picons/tvh/"
piconpathvdr="/storage/picons/vdr/"
thumbnailpath="/storage/.kodi/userdata/Thumbnails/"
inputfile="31_oerlie_program_numbering.csv"
OLDIFS="$IFS"
IFS=","

mkdir $piconpathtvh
mkdir $piconpathvdr

rm $piconpathtvh*
rm $piconpathvdr*
rm -r $thumbnailpath*

ls -la $piconpathtvh
ls -la $piconpathvdr
ls -la $thumbnailpath

[ ! -f $inputfile ] && { echo "$inputfile file not found"; exit 99; }
while read progname progno piconsource picon
do
        echo "progname: $progname"
        echo "progno: $progno"
        echo "piconource: $piconsource"
        echo "picon: $picon"
        echo "channelconfallfiles: $channelconfallfiles"
        progconfigfile="$(grep -l $picon $channelconfallfiles)"
        echo "progconfigfile: $progconfigfile" 

        piconfullpath=$piconpathtvh$picon
        wget $piconsource -O $piconfullpath
        cp $piconfullpath $piconpathvdr$picon
        if [ -n "$progconfigfile" ]
           then
               sed -i "3s/\ 0/\ $progno/" $progconfigfile 
               cat $progconfigfile
        fi
done < $inputfile
IFS=$OLDIFS

ps -ef|grep tvheadend
pkill tvheadend
sleep 15
ps -ef|grep tvheadend

ps -ef | grep kodi.bin
pkill kodi.bin
sleep 15
ps -ef | grep kodi.bin
