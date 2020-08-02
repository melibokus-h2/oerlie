# Datei: oerlie_installation_01.sh
# Stand: 11.01.2019
# Inhalt: Bereitstellung des LibreELEC-Systems auf einer Micro-SD-Karte
# Die Vorgehensweise ist auf dieser Webseite beschrieben: 
# https://libreelec.tv/downloads/
#-----------------------------------------------------------------------
# alternativ kann mit einem Linux Rechner wie folgt vorgegangen werden 
# die nachfolgenden Aktionen werden im Terminal 
# eines Linux Rechners duchgeführt
#-----------------------------------------------------------------------
# ein Terminal öffnen
# ein Arbeitsverzeichnis einrichten und dorthin wechseln
cd 
mkdir oerlie
cd oerlie
#-----------------------------------------------------------------------
# das komprimierte LibreELEC Systemabbild (image file) downloaden
#wget https://ftp.fau.de/libreelec/LibreELEC-Odroid_C2.arm-8.95.002.img.gz
wget https://ftp.fau.de/libreelec/LibreELEC-RPi2.arm-8.95.002.img.gz
#-----------------------------------------------------------------------
# das komprimierte LibreELEC Systemabbild (image file) entpacken 
#gunzip -d LibreELEC-Odroid_C2.arm-8.95.002.img.gz
gunzip -d LibreELEC-RPi2.arm-8.95.002.img.gz
#-----------------------------------------------------------------------
# angeschlossene Partitionen und 
# damit auch die zu beschreibende Micro-SD-Karte identifizieren
# falls Root-Rechte nötig sind, 
# die nachfolgenden Kommandos mit "sudo " einleiten
parted -l
#-----------------------------------------------------------------------
# die zu beschreibende SD-Karte unmounten (falls gemounted)
umount /dev/sda
#-----------------------------------------------------------------------
# das LibreELEC Systemabbild auf die Micro-SD-Karte schreiben
#dd if=LibreELEC-Odroid_C2.arm-8.95.002.img of=/dev/sda bs=4M
dd if=LibreELEC-RPi2.arm-8.95.002.img of=/dev/sda bs=4M
#-----------------------------------------------------------------------
# den Scheibvorgang auf die SD-Karte sicher abschließen
sync 
#-----------------------------------------------------------------------
# damit ist die Bereitstellung des LibreELEC-Systems 
# auf der SD-Karte abgeschlossen
# nicht mehr benötigtes LibreELEC Systemabbild (image file) löschen 
#rm LibreELEC-Odroid_C2.arm-8.95.002.img
rm LibreELEC-RPi2.arm-8.95.002.img
#-----------------------------------------------------------------------
# die mit dem LibreELEC Systemabbild besschriebene Micro-SD-Karte 
# entnehmen und in den Einplatinenrechner einstecken
#-----------------------------------------------------------------------
