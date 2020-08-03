# Datei: 21_oerlie_sd_installtion.sh
# Stand: 01.08.2020
# Inhalt: Bereitstellung des LibreELEC-Systems auf einer Micro-SD-Karte
# Die Vorgehensweise ist auf dieser Webseite beschrieben: 
# https://libreelec.tv/downloads/
#-----------------------------------------------------------------------
# alternativ kann mit einem Linux Rechner wie folgt vorgegangen werden 
# die nachfolgenden Aktionen werden im Terminal 
# eines Linux Rechners duchgeführt
# Aufruf: sudo ./21_oerlie_sd_installation.sh
#-----------------------------------------------------------------------
# Kommandoausgabe einschalten
set -x
#-----------------------------------------------------------------------
# Hier die jeweils zu installierende Libreelec Version ohne Endung .gz
# libreelecimagefile=LibreELEC-Odroid_C2.arm-9.0.2.img
libreeleczipfile=libreelecfile.img.gz
libreelecimagefile=libreelecfile.img
libreelecdownloadpath=xxx

# weitere Einstellungen
libreelecftpserver=https://ftp.fau.de/libreelec/

sdkarte=xxx
kannweg=xxx
libreelecsdmountpath=/media/h2/STORAGE/
oerlieinstalldir=oerlie
oerlieworkingdir=oerlie
# ein Terminal öffnen
# ein Arbeitsverzeichnis einrichten und dorthin wechseln
mkdir $oerlieworkingdir
cd $oerlieworkingdir

echo "Jetzt unter https://ftp.fau.de/libreelec das geeignete Systemabbild auswählen und den vollständigen Link hier angeben (*.img.gz Dateien):"
echo "Beispiel: https://ftp.fau.de/libreelec/LibreELEC-RPi4.arm-9.2.3.img.gz"
read libreelecdownloadpath

#-----------------------------------------------------------------------
# das komprimierte LibreELEC Systemabbild (image file) downloaden
#wget https://ftp.fau.de/libreelec/LibreELEC-Odroid_C2.arm-8.95.002.img.gz
wget -O $libreeleczipfile $libreelecdownloadpath
#-----------------------------------------------------------------------
# das komprimierte LibreELEC Systemabbild (image file) entpacken 
#gunzip -d LibreELEC-Odroid_C2.arm-8.95.002.img.gz
gunzip -d $libreeleczipfile

#-----------------------------------------------------------------------
# angeschlossene Partitionen und 
# damit auch die zu beschreibende Micro-SD-Karte identifizieren
# falls Root-Rechte nötig sind, 
# die nachfolgenden Kommandos mit "sudo " einleiten
parted -l
#-----------------------------------------------------------------------
echo "Jetzt die Adresse der SD-Karte im Dateisystem eingeben, wie sie sich aus der obigen Darstellung ergibt (z.B. /dev/sda):"
read sdkarte
echo "Libreelec image wird nach "$sdkarte" geschrieben: ALLE DATEN AUF "$sdkarte" WERDEN GELÖSCHT!!!"
echo "...weiter mit \"Enter\", abbrechen mit \"Strg c\""
read kannweg
#-----------------------------------------------------------------------
# die zu beschreibende SD-Karte unmounten (falls gemounted)
umount $sdkarte
#-----------------------------------------------------------------------
# das LibreELEC Systemabbild auf die Micro-SD-Karte schreiben
# example dd if=LibreELEC-Odroid_C2.arm-8.95.002.img of=/dev/sda bs=4M
dd if=$libreelecimagefile of=$sdkarte bs=4M
#-----------------------------------------------------------------------
# den Scheibvorgang auf die SD-Karte sicher abschließen
sync 
#-----------------------------------------------------------------------
# damit ist die Bereitstellung des LibreELEC-Systems 
# auf der SD-Karte abgeschlossen
# nicht mehr benötigtes LibreELEC Systemabbild (image file) löschen 
#rm LibreELEC-Odroid_C2.arm-8.95.002.img
rm $libreelecimagefile
cd ..
rmdir oerlie
mount -o remount,rw /dev/sda1
mount -o remount,rw /dev/sda2
sync
echo "...weiter mit \"Enter\", abbrechen mit \"Strg c\""
read kannweg
#mkdir $libreelecsdmountpath$oerlieinstalldir
#mkdir $libreelecsdmountpath$oerlieinstalldir/oerlie_dvbt_configuration
# oerlie_dvbt_configuration cp 22_oerlie_libreelec_kodi_installation $libreelecsdmountpath$oerlieinstalldir
#cp 31_oerlie_my_stations.json $libreelecsdmountpath$oerlieinstalldir
# nicht benötigt auf libreelec cp 31_oerlie_program_numbering.csv $libreelecsdmountpath$oerlieinstalldir
#cp 31_oerlie_prog-sorted $libreelecsdmountpath$oerlieinstalldir
#cp 32_oerlie_config_tvh_clear_init.sh $libreelecsdmountpath$oerlieinstalldir
#cp 33_oerlie_config_tvh_picons_numbers.sh $libreelecsdmountpath$oerlieinstalldir
#cp ./oerlie_dvbt_configuration/* $libreelecsdmountpath$oerlieinstalldir/oerlie_dvbt_configuration
# den Scheibvorgang auf die SD-Karte sicher abschließen
#sync 

#-----------------------------------------------------------------------
# die mit dem LibreELEC Systemabbild besschriebene Micro-SD-Karte 
# entnehmen und in den Einplatinenrechner einstecken
#-----------------------------------------------------------------------
