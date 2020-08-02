#!/bin/bash
# Datei: 34_oerlie_config_xmltv.sh
# Stand: 01.02.2020
# Inhalt: TvHeadend Installation vorbereiten, Konfigurationsdateien bereitstellen
#-----------------------------------------------------------------------
set +x

rm xml*
#wget -O xmltv.xml http://localhost:9981/xmltv
wget -O xmltv.xml http://oerlie-ma:9981/xmltv
sed '/programme/,$ d' xmltv.xml >xmltv_ol
sed ':a;N;$!ba;s/">\n  <display-name>/;/g' xmltv_ol >xmltv_ol1
sed ':a;N;$!ba;s/<\/display-name>\n  <icon /;/g' xmltv_ol1 >xmltv_ol2
sed 's/;src.*/eindeutiger identifier/g' xmltv_ol2 >xmltv_ol3
sed -n 's:<channel id="\(.*\)eindeutiger identifier:\1:p' xmltv_ol3 >xml_channel_list

#sed -n 's:<channel id="\(.*\)</display-name>:\1:p' xmltv_channels_one_line >xml_channel_list

#sed -e '/programme/,$ d' -e ':a;N;$!ba;s/">\n xmltv.xml >xmltv_channels_one_line

sed -n 's:.*<channel id="\(.*\)</display-name>..*:\1:p' xmltv_channels_one_line >oerlie_channel_list

#sed 'N;N;s/">\n.*<display-name>/;/g' xmltv_channels >xmltv_channels_one_line
#sed 's/\">.*\n.*<display-name>/;/g' xmltv_channels >xmltv_channels_one_line

#sed -n 's:.*<channel id="\(.*\)</display-name>.*:\1:p' xmltv_channels_one_line >xml_channel_id_list



#sed -n 's:.*<display-name>\(.*\)</display-name>.*:\1:p' xmltv.xml
#sed -n 's:.*<channel id="\(.*\)">.*:\1:p' xmltv.xml
#sed -n 's:.*<display-name>\(.*\)</display-name>.*:\1:p';'s:.*<channel id="\(.*\)">.*:\1:p' xmltv.xml
#sed -n 's:.*<channel id="\(.*\)</display-name>..*:\1:p' xmltv.xml
#sed -e '1,/<channel id=/ d' -e '/</display-name>/,$ d' xmltv.xml
#sed /<programme,$/d
#sed '/\<progamme/,$ d' xmltv.xml >kannweg
#sed  '/progamme/,/$$/d' xmltv.xml >kannweg
#sed '/programme/,$ d' xmltv.xml >xmltv_channels
#sed '1n;N;s/">\n/;/g' xmltv_channels xmltv_channels_one_line
#sed -e '/programme/,$ d' -en 's:.*<display-name>\(.*\)</display-name>.*:\1:p' xmltv.xml

