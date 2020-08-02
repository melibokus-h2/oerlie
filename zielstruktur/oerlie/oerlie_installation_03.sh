# Datei: oerlie_installation_03.sh
# Stand: 12.01.2019
# Inhalt: Weitere Kodie und TvHeadend DVB-T2 Konfiguration
#-----------------------------------------------------------------------
# Die Aktionen werden auf der Secure Shell 
# des Einplatinenrechners duchgeführt.
# Dazu eine Shel starten ...
# Linux: Terminal öffenen
# Windows: CMD öffnen 
# ssh root@oerlie eingeben
# Passwort: libreelec
#-----------------------------------------------------------------------
cd
mkdir oerlie
cd oerlie
#
#-----------------------------------------------------------------------
#  Über einen Browser auf der Konfigurations von TvHeadend anmelden.
#-----------------------------------------------------------------------
#
wget https://github.com/melibokus-h2/oerlie/blob/develop/download/readme


#------------------------------------------------------------------------------------------------------------------------------
# Die nachfolgenden Aktionen auf werden im Terminal eines Linux Rechners bzw. auf der sucure shell des Zielrechners duchgeführt
#------------------------------------------------------------------------------------------------------------------------------
# Passwort libreelec
ssh root@oerlie

mkdir downloads
cd downloads
wget bit.ly/kn-pipe-tv
ls -lat
cp kn-pipe-tv kn-pipe-tv-adapted
ls -lat
sed s/usr/'storage\/.kodi\/addons\/tools.ffmpeg-tools'/g kn-pipe-tv >kn-pipe-tv-adapted
ls -lat
sed '1n;N;s/\n/;/g' kn-pipe-tv-adapted >kn-pipe-tv-adapted-one-line
ls -lat
cat > ~/downloads/prog-sorted

Das Erste HD
ZDF HD
hr-fernsehen
SWR Rheinland-Pfalz HD
BR Fernsehen Nord HD
NDR Niedersachsen HD
WDR HD
rbb Berlin HD
MDR Sachsen HD
ARTE HD
3sat
one HD
ZDFneo
ARD-alpha
KiKA
Welt der Wunder
ANIXE HD
blizz TV
Family TV
Nickelodeon
Bibel TV
ORF eins HD
ORF 2 HD
ORF III HD
phoenix
tagesschau24
ZDFinfo
Deutsche Welle
Deutsche Welle (EN)
Parlamentsfernsehen 1
Parlamentsfernsehen 2
n-tv
WELT
Sky Sport News HD
oe24 TV                     
ORF SPORT +
ABC News
NASA TV
CBSN
CBN News
Bloomberg TV
MSNBC
Sky News
TRT World HD
RT HD
NHK WORLD TV
Al Jazeera English
Sylt1
noa4 Norderstedt HD
noa4 Hamburg HD
Hamburg 1
oldenburg eins
ALEX Berlin
tv.berlin
Potsdam TV
Leipzig Fernsehen
Chemnitz Fernsehen
Dresden Fernsehen
nrwision
center.tv Düsseldorf
OK Koblenz
OK Trier
TV Mittelrhein
Westerwald TV
main.tv
rheinmaintv
Rhein Neckar Fernsehen
Baden TV
L-TV                        
münchen.tv
Franken Fernsehen
Oberpfalz TV
Regio TV Schwaben
TV Würzburg
Isar TV
Donau TV
allgäu.tv
Tirol TV
TeleZüri HD
TeleBärn HD
dorf tv
DRF1
eRtv
intv
KabelJournal
RFO
TRP1
TV Touring
TVA
TVO
RE eins TV
SWR Baden-Württemberg HD 
NDR Schleswig-Holstein HD
NDR Mecklenburg-Vorpommern HD
NDR Hamburg HD
BR Fernsehen Süd HD
MDR Sachsen-Anhalt HD
MDR Thüringen HD
rbb Brandenburg HD
SR Fernsehen HD
ARD Event 1
ARD Event 2
ZDF Event 1                 
ZDF Event 2
ZDF Event 3
ZDF Event 4
ZDF Event 5
ZDF Event 6
ARTE Event 1
ARTE Event 2
ARTE Event 3
ARTE Event 4
WDR Event 1
WDR Event 2
WDR Event 3
WDR Event 4
SWR Event 1
SWR Event 2
SWR Event 3
SWR Event 4
NDR Event 1
NDR Event 2
NDR Event 3
NDR Spezial 1
NDR Spezial 2
NDR Spezial 3
NDR Spezial 4
NDR Spezial 5
NDR Spezial 6
BR Event 1
BR Event 2
BR Event 3
BR Event 4
MDR+ 1
MDR+ 2
MDR+ 3
HR Event 1                  
HR Event 2
rbb Event 1
rbb Event 2
Deutsches Musik Fernsehen
K-TV
EWTN katholisches TV
ERF 1
health.tv
VISIT-X.tv
1-2-3.tv
pearl.tv
QVC
QVC PLUS
QVC Beauty & Style
Genius Plus TV
Das Erste
ServusTV HD
eoTV HD
RiC / eoTV
MTV Germany
DELUXE MUSIC
nice
Folx TV
a.tv
DJing
DJing Animation
DJing Classics
DJing Electro Rock
DJing French touch
DJing Hedonist
DJing Hot Hot Hot
DJing Ibiza
DJing Karaoke
DJing Summer Vibes          
DJing Underground
DJing Wild EDM
ServusTV HD (AT)
gotv
Okto
M4TV
W24 TV
Kronehit TV
Sporttime TV 1
Sporttime TV 2
Sporttime TV 4
Sporttime TV 5
Tele M1 HD
TVO (CH)
TeleBielingue
TVM3
Telebasel
Adult Swim
JUCE TV
SBN
GOD TV
Voice of America
KTVU Fox 2
WGN-TV
CMC
Hunt Channel
Create & Craft TV
Capital TV
Heart TV
London Live
Press TV
CHCH
TVNZ 1
TVNZ 2                      
Three
ARTE HD (FR)
France 24
NRJ HITS TV
BFMTV
XITE
TV 538
SDF
m2o Tv
Rai News 24
supertennis.tv
Fjorton
Digi 24 HD
ProTv News
Realitatea TV
Romania TV
Sitel
Kanal 5
Alfa
Telma
24 Vesti
RT Spanish HD
RT Documentary
MetroTV
Al Jazeera
Dubai One
KVF
ALBUK TV
RTÉ News Now
Mello TV

# mit Strg d, bzw ctrl d abschließen
ls -lat
sed "s/^/sed \-ne \'\/\"/;s/$/\"\/p\' kn\-pipe\-tv\-adapted\-one\-line \>\>kn\-pipe\-tv\-adapted\-one\-line\-sorted/" prog-sorted >sort-sed
ls -lat
sed 's/ \/ / \\\/ /g' sort-sed > sort-sed-clean
ls -lat
echo "#EXTM3U" >kn-pipe-tv-adapted-one-line-sorted
ls -lat
sh sort-sed-clean
ls -lat
sed 's/;pipe/\npipe/g' kn-pipe-tv-adapted-one-line-sorted >kn-pipe-tv-adapted-sorted
ls -lat

# Rechte Maustaste, d.h. Kontextmenu, auf die rote Taste der Fernsehfernbedinung legen
cat > ~/.kodi/userdata/keymaps/remote.xml
<?xml version="1.0" encoding="UTF-8"?>

<keymap>
  <global>
    <remote>
    <red>contextmenu</red>
    </remote>
  </global>
</keymap>

# mit Strg d, bzw ctrl d abschließen

cat ~/.kodi/userdata/keymaps/remote.xml

cd ~/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t
rm de-*
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Baden-Wuertemberg
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Bayern
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Berlin
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Brandenburg
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Bremen
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-generic-all-channels
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Hamburg
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Hessen
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Mecklenburg-Vorpommern
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Niedersachsen
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Nordrhein-Westfalen
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Rhein-Main-Neckar
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Rheinland-Pfalz
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Saarland
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Sachsen
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Sachsen-Anhalt
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Schleswig-Holstein
wget https://github.com/melibokus-h2/oerlie/blob/master/download/.kodi/addons/service.tvheadend42/dvb-scan/dvb-t/de-Thueringen




cat > de-Rhein-Main-Neckar-dvb-t2

# mit Strg d, bzw ctrl d abschließen


cd ~
ls -la ~/picons/tvh
ls -la ~/picons/vdr
cd ~/picons/tvh
wget https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Das_Erste_HD_Corner-Logo_2015.png/320px-Das_Erste_HD_Corner-Logo_2015.png -O 1_0_1_301_9802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Das_Erste_HD_Corner-Logo_2015.png/320px-Das_Erste_HD_Corner-Logo_2015.png -O 1_0_1_301_3802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/ZDF_HD_Logo.svg/320px-ZDF_HD_Logo.svg.png -O 1_0_1_7D1_203_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Hr-fernsehen_HD.svg/170px-Hr-fernsehen_HD.svg.png -O 1_0_1_341_4602_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Hr-fernsehen_HD.svg/170px-Hr-fernsehen_HD.svg.png -O 1_0_1_341_3902_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/SWR_Logo.svg/320px-SWR_Logo.svg.png -O 1_0_1_3E2_4602_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/SWR_Logo.svg/320px-SWR_Logo.svg.png -O 1_0_1_3E2_3902_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/SWR_Logo.svg/320px-SWR_Logo.svg.png -O 1_0_1_3E1_3902_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/SR_Dachmarke.svg/314px-SR_Dachmarke.svg.png -O 1_0_1_6D1_9802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/3/39/BR_Fernsehen_HD_Logo_2016.png -O 1_0_1_322_3902_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/3/39/BR_Fernsehen_HD_Logo_2016.png -O 1_0_1_321_4602_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/WDR_HD.svg/320px-WDR_HD.svg.png -O 1_0_1_406_3902_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/WDR_HD.svg/320px-WDR_HD.svg.png -O 1_0_1_806_4602_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/NDR_HD.svg/500px-NDR_HD.svg.png -O 1_0_1_381_4602_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Rbb_fernsehen_HD_Logo_2017.svg/320px-Rbb_fernsehen_HD_Logo_2017.svg.png -O 1_0_1_6B1_3802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Rbb_fernsehen_HD_Logo_2017.svg/320px-Rbb_fernsehen_HD_Logo_2017.svg.png -O 1_0_1_3B1_4602_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Mdr_Fernsehen_HD_Logo_2017.png/320px-Mdr_Fernsehen_HD_Logo_2017.png -O 1_0_1_663_4602_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/b/bd/Arte_Logo_HD_2011.png -O 1_0_1_302_9802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/b/bd/Arte_Logo_HD_2011.png -O 1_0_1_302_3802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/3sat_HD.svg/320px-3sat_HD.svg.png -O 1_0_1_7D4_203_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/One_HD_Logo.svg/320px-One_HD_Logo.svg.png -O 1_0_1_305_9802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/One_HD_Logo.svg/320px-One_HD_Logo.svg.png -O 1_0_1_305_3802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Zdf_neo_hd.svg/320px-Zdf_neo_hd.svg.png -O 1_0_1_7D3_203_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/KiKA_HD.svg/320px-KiKA_HD.svg.png -O 1_0_1_7D5_203_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Phoenix_Logo_2018_ohne_Claim.svg/320px-Phoenix_Logo_2018_ohne_Claim.svg.png -O 1_0_1_303_9802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Phoenix_Logo_2018_ohne_Claim.svg/320px-Phoenix_Logo_2018_ohne_Claim.svg.png -O 1_0_1_303_3802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Tagesschau24HD.svg/320px-Tagesschau24HD.svg.png -O 1_0_1_304_9802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Tagesschau24HD.svg/320px-Tagesschau24HD.svg.png -O 1_0_1_304_3802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/ZDF_info_HD.svg/320px-ZDF_info_HD.svg.png -O 1_0_1_7D2_203_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/ARD_alpha.svg/320px-ARD_alpha.svg.png -O 1_0_1_623_3802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/ARD_alpha.svg/320px-ARD_alpha.svg.png -O 1_0_1_623_9802_2114_EEEE0000_0_0_0.png
wget https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Bibel_TV_logo.png/320px-Bibel_TV_logo.png -O 1_0_1_4248_4061_2114_EEEE0000_0_0_0.png
cp ~/picons/tvh/* ~/picons/vdr
ls -la ~/picons/tvh
ls -la ~/picons/vdr
cd ~


cd ~/.kodi/userdata/addon_data/service.tvheadend42/channel
cp config config_original
grep -l 1_0_1_301_9802_2114_EEEE0000_0_0_0.png *sed 's/number\"\: 0/number\"\: 1/g' >kannweg_neu



#----------------------------------------------------------------------------------------------------
# Die nachfolgenden Aktionen auf werden im Browser auf der Tvheadend-Konfigurationsseite durchgeführt
#----------------------------------------------------------------------------------------------------
# TvHeadhend Server konfigurieren: http://oerlie:9981
# Configuration > General > Base > Server section > User interface level > Expert
# Configuration > General > Base > Start wizard
#   Fenster "Welcome - Tvheadend - your ..." : Web interface > Language > English
#   Fenster "Welcome - Tvheadend - your ..." : EPG Language (priority order) > Language 1 > German 
#   Fenster "Welcome - Tvheadend - your ..." : EPG Language (priority order) > Language 2 > English 
#   Fenster "Welcome - Tvheadend - your ..." : EPG Language (priority order) > Language 3 > French
#   Fenster "Welcome - Tvheadend - your ..." : Network access, Administrator login, User login > bleiben leer
#   Fenster "Network Settings" : Tuner > IPTV ; Network type > IPTV Automatic Network
#   Fenster " Assign predefined muxes to networks" : URL > file:///storage/downloads/kn-pipe-tv-adapted-sorted
#   --> Als Ergebnis erscheint z.B. "Found muxes 235"; "Found services 145"
#   Fenster "Service mapping" : Map all services; Create provider tags; Create network tags
#   Configuration > DVB Inputs > Networks > Edit Network > Channel numbers from 1 > Save
#------------------------------------------------------------------------------------------------------------
# Die nachfolgenden Aktionen auf mit der Kodi Benutzeroberfläche des Zielrechners (Odroid/Raspi) durchgeführt
#------------------------------------------------------------------------------------------------------------
# Neustarten
# fertig

#------------------------------------------------
# Weitere Konfigurationen zunächst nicht benötigt
#------------------------------------------------
