# Installation Stand 25.12.2018
#-----------------------------------------------------------------------------------
# Die nachfolgenden Aktionen auf werden im Terminal eines Linux Rechners duchgeführt
#-----------------------------------------------------------------------------------
# Downloade das komprimierte LibreELEC Systemabbild (image file)
#wget https://ftp.fau.de/libreelec/LibreELEC-RPi2.arm-8.95.001.img.gz
wget https://ftp.fau.de/libreelec/LibreELEC-Odroid_C2.arm-8.95.001.img.gz
# Entpacke das Systemabbild
# gunzip -d LibreELEC-RPi2.arm-8.95.001.img.gz
gunzip -d LibreELEC-Odroid_C2.arm-8.95.001.img.gz
# Lösche das komprimierte LibreELEC Systemabbild
#rm LibreELEC-RPi2.arm-8.95.001.img.gz
rm LibreELEC-Odroid_C2.arm-8.95.001.img.gz
# Identifizere die angeschlossenen leere SD-Karte
sudo parted -l
# SD Karte aushängen
sudo umount /dev/sda
# LibreELEC Systemabbild 1:1 auf die SD-Karte schreiben
#sudo dd if=LibreELEC-RPi2.arm-8.95.001.img of=/dev/sda bs=4M
sudo dd if=LibreELEC-Odroid_C2.arm-8.95.001.img of=/dev/sda bs=4M
# Sicherstellen, dass der Scheibvorgang auf die SD-Karte abgeschlossen ist
sudo sync 
# SD-Karte entnehmen und in Zielrechner einsetzen. Sodann Zielrechner starten.
#------------------------------------------------------------------------------------------------------------
# Die nachfolgenden Aktionen auf mit der Kodi Benutzeroberfläche des Zielrechners (Odroid/Raspi) durchgeführt
#------------------------------------------------------------------------------------------------------------
# Starteinstellungen vormnhemen
# 01. Systemname neu setzen: oerlie
# 02. Netzwerkverbindung herstellen
# 03. Sharing and Remote Access, Configure Servces: SSH und Samba aktivieren
#----------------------------------------------------------
# Weitere Einstellungen über das Einstellungsmenü vornehmen
#----------------------------------------------------------
# 04. Einstellungen (Zahnrad) > LibreElec > System > Keyboard > keayboard Layout > de
# 05. optional: Einstellungen/System (Zahnrad) > LibreElec > Updates > Automatic Updates > manual
# 06. Einstellungen (Zahnrad) > LibreElec > Network > NTP servers > Timeserver #1 > ptbtime1.ptb.de
# 07. Einstellungen (Zahnrad) > LibreElec > Network > NTP servers > Timeserver #2 > ptbtime2.ptb.de
# 08. Einstellungen (Zahnrad) > LibreElec > Network > NTP servers > Timeserver #3 > ptbtime3.ptb.de
# 09. Einstellungen (Zahnrad) > Interface > Regional > Language > German
# 10. Einstellungen (Zahnrad) > Benutzeroberfläche > Zahnrad Standard > Zahnrad Experte
# 11. Einstellungen (Zahnrad) > Benutzeroberfläche > Regional > Tastaturbelegung > English ... abwählen (ok), German QWERTZ auswählen (ok, ok)
# 12. Einstellungen (Zahnrad) > Benutzeroberfläche > Regional > Standardformat für die Region > deutschland
# 13. Einstellungen (Zahnrad) > Benutzeroberfläche > Regional > Zeitzonen Region > Germany
# 14. Einstellungen (Zahnrad) > Benutzeroberfläche > Regional > Startup > Startfenster > TV-Kanäle
# 15. Einstellungen (Zahnrad) > System > Anzeige > Video kalibrieren > (Cursortasten und ok)
# 16. Einstellungen (Zahnrad) > System > Eingabe > Periperiegeräte > CEC Adapter > ...
# 17. Einstellungen (Zahnrad) > System > Eingabe > Tastaturbelegungen > German
# 18. Einstellungen (Zahnrad) > Addons > Aus Repository installieren > Alle Repositories > Dienste > TvHeadend Server > Installieren
# 19. Einstellungen (Zahnrad) > Addons > Aus Repository installieren > Alle Repositories > PVR Clients > TvHeadend HTSP Client > Installieren
# 20. Einstellungen (Zahnrad) > Addons > Aus Repository installieren > Alle Repositories > Programm-Addons > FFmpeg-Tools > Installieren
# 21. Einstellungen (Zahnrad) > Addons > Aus Repository installieren > Alle Repositories > video > (3sat mediathek, ARD Mediathek, video ARTE +7, BR Mediathek, HR Mediathek, Kika mediathek, MDR Mediathek, Mediathek, NDR Mediathek, Phoenix Mediathek, SR Mediathek, SWR Mediathek, Tagesschau, WDR Mediathek, Youtube, ZDF Mediathek, ZDF mediathek 2016)
# 22. Einstellungen (Zahnrad) > Benutzeroberfläche > Skins > Skin konfigurieren > Hauptmenüeinträge > ... geeignet auswählen
# 23. Einstellungen (Zahnrad) > PVR & TV > Allgemein > Kanalnummern des Backends verwenden
#------------------------------------------------------------------------------------------------------------------------------
# Die nachfolgenden Aktionen auf werden im Terminal eines Linux Rechners bzw. auf der sucure shell des Zielrechners duchgeführt
#------------------------------------------------------------------------------------------------------------------------------
# IPTV Senderliste (mu3-Liste) vorbereiten
# Über eine Secure Shell (ssh) mit oerli verbinden, Passwort: libreelec
ssh root@oerli
# Promt: oerlie:~ # erscheint
cd downloads
# Download m3u Playliste
wget bit.ly/kn-pipe-tv
# Kontrolle
more kn-pipe-tv
#kompatibilität der Anleitung für die nächsten Schritte sicherstellen
cp kn-pipe-tv kn-pipe-tv-adapted
# Kontrolle
ls -lat
# nachfolgender Schritt für libreelec 8.90 ff
# Ersetze Pfadangabe im Programmaufruf ffmpeg durch das Verzeichnis, in dem ffmpeg bei librelec-Installation liegt (zuvor ADDON ffmpeg-tools installieren)
sed s/usr/'storage\/.kodi\/addons\/tools.ffmpeg-tools'/g kn-pipe-tv >kn-pipe-tv-adapted
# Die Information zu jedem Kanal in einer Zeile statt in zwei Zeilen ablegen 
sed '1n;N;s/\n/;/g' kn-pipe-tv-adapted >kn-pipe-tv-adapted-one-line
# Liste der Kanalnamen erstellen, d.h. alles übrige löschen und enthaltene "/" durch "\/" ersetzen.
# Wird nur benötigt wenn man selbst sortieren will
#sed '1n;N;s/\n/;/g' kn-pipe-tv|sed s/'#EXTINF:-1 tvg-name=\"'//g|sed 's/\" .*//'|sed '1,1d'|sed 's/\//\\\//'g >prog-list
# Programme sortieren und Ergebnis in der Datei prog-sorted ablegen ... manueller Schritt
# oerlie Standardsortierung anlegen
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
# Kontrolle
cat ~/downloads/prog-sorted
# Datei mit je einem sed Befehl pro Programm anlegen 
sed "s/^/sed \-ne \'\/\"/;s/$/\"\/p\' kn\-pipe\-tv\-adapted\-one\-line \>\>kn\-pipe\-tv\-adapted\-one\-line\-sorted/" prog-sorted >sort-sed
# " / " suchen und mit " \/ " ersetzen
sed 's/ \/ / \\\/ /g' sort-sed > sort-sed-clean
#Ergebnisdatei mit header anlegen
echo "#EXTM3U" >kn-pipe-tv-adapted-one-line-sorted
#Vorher angelegte Skriptdatei mit sed Befehlen ausführen 
sh sort-sed-clean
#Einzeilge Einträge pro Programm wieder auf 2 Zeilen aufteilen
sed 's/;pipe/\npipe/g' kn-pipe-tv-adapted-one-line-sorted >kn-pipe-tv-adapted-sorted
# Kontrolle
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
# Kontrolle
cat ~/.kodi/userdata/keymaps/remote.xml
#----------------------------------------------------------------------------------------------------
# Die nachfolgenden Aktionen auf werden im Browser auf der Tvheadend-Konfigurationsseite durchgeführt
#----------------------------------------------------------------------------------------------------
# TvHeadhend Server konfigurieren: http://oerlie:9981
# 01. Configuration > General > Base > Start wizard
# 02. Fenster "Welcome - Tvheadend - your ..." : Web interface > Language > English
# 03. Fenster "Welcome - Tvheadend - your ..." : EPG Language (priority order) > Language 1 > German 
# 04. Fenster "Welcome - Tvheadend - your ..." : EPG Language (priority order) > Language 2 > English 
# 05. Fenster "Welcome - Tvheadend - your ..." : EPG Language (priority order) > Language 3 > French
# 06. Fenster "Welcome - Tvheadend - your ..." : Network access, Administrator login, User login > bleiben leer
# 07. Fenster "Network Settings" : Tuner > IPTV ; Network type > IPTV Automatic Network
# 08. Fenster " Assign predefined muxes to networks" : URL > file:///storage/downloads/kn-pipe-tv-adapted-sorted
# Als Ergebnis erscheint bei mir Found muxes 235; Found services 145
# 09. Fenster "Service mapping" : Map all services; Create provider tags; Create network tags
# 10. Configuration > DVB Inputs > Networks > Edit Network > Channel numbers from 1 > Save
#------------------------------------------------------------------------------------------------------------
# Die nachfolgenden Aktionen auf mit der Kodi Benutzeroberfläche des Zielrechners (Odroid/Raspi) durchgeführt
#------------------------------------------------------------------------------------------------------------
# Neustarten
# fertig