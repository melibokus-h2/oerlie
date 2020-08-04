# Datei: oerlie_installation_02.sh
# Stand: 28.04.2019
# Inhalt: LibreELEC-Systems und Kodi einrichten
#-----------------------------------------------------------------------
# Den Einplatinenrechner 
# - mit einem HDMI-Kabel mit dem Fersehgerät verbinden
# - mit einem Netzwerkkabel mit einem Router und dem Internet verbinden
# - die mit dem LibreELEC Systemabbild besschriebene Micro-SD-Karte
#   in den Einplatinenrechner einstecken.
# Das Fersehgerät einschalten.
# Den Einplatinenrechner an die Stromversorgung anschließen.
#-----------------------------------------------------------------------
# Die nachfolgenden Aktionen werden auf der Kodi Benutzeroberfläche 
# des Einplatinenrechners durchgeführt, die auf dem Fersehgerät
# (nach der dem Hochfahren angezeigt wird.
# Die Bedienung erfolgt mit der Fernbedienung des Fersehgeräts.
#-----------------------------------------------------------------------
# Nach  dem Hochfahren erscheint der LibreELEC Ersteinrichtugsdialog.
# Darin werden folgende Einstellungen vorgenommen:
# Fenster: "Welcome to LibreELEC"
# > Next
# "Hostname": LibreELEC in oerlie-xx ändern > Next
# "Networking": ggf. WLAN einrichten > Next
# "Configure Services": SSH und Samba  aktivieren. > Next
# "Thank you" > Next
#-----------------------------------------------------------------------
# Weitere Einstellungen über das Einstellungsmenü (Zahnrad) = EZ, 
# oben, mittig unter dem KODI Schriftzug, vornehmen ...
#-----------------------------------------------------------------------
# Zur erleichterung der Bedienung jetzt alternativ
#-----------------------------------------------------------------------
# entweder Bluetooth Tastatur verbinden
# EZ > LibreElec (ganz unten) > Services > Bluetooth > Enable Bluetooth
# EZ > LibreElec (ganz unten) > Bluetooth > (Tastatur sichtbar machen) 
#                > pair > (angezeigten Code auf der Tastatur eintippen)
#-----------------------------------------------------------------------
# oder Smartphone App Kore einrichten/nutzen: 
# https://play.google.com/store/apps/details?id=org.xbmc.kore&hl=de
# EZ > Services > General > Device Name > Kodie ändern in oerlie 
# EZ > Services > Control > Allow remote control via HTTP 
# EZ > Services > Control > Username > kodi ändern in oerlie
# Über "Ausschalter" auf dem Hauptbildschirm (links oben) und Reboot, 
# Kodi neu starten.
# In der App Kore "Media Center hinzufügen", dann "oerlie" auswählen.
# App zur Steuerung von Kodi nutzen, insbesondere "Texteingabe" über 
# die Auswahl "drei Punkte" oben rechts, neben dem Ausschaltknopf.
#-----------------------------------------------------------------------
# oder usb Tastatur verbinden: 
# einfach USB Tastatur in freie USB Buchse einstecken.
#-----------------------------------------------------------------------
# Konfiguration fortsetzen
#-----------------------------------------------------------------------
# EZ > LibreElec (ganz unten) > servers > Timeserver #1 > ptbtime1.ptb.de
# EZ > LibreElec > Network > NTP servers > Timeserver #2 > ptbtime2.ptb.de
# EZ > LibreElec > Network > NTP servers > Timeserver #3 > ptbtime3.ptb.de
# EZ > Interface > Regional > Language > German
# EZ > Benutzeroberfläche > (Zahnrad, links unten) "Standard" > 2x anklicken bis "Experte" erscheint
# EZ > Benutzeroberfläche > Regional > Tastaturbelegung > English ... abwählen (ok), German QWERTZ auswählen (ok, ok)
# EZ > Benutzeroberfläche > Regional > Standardformat für die Region > Deutschland
# EZ > Benutzeroberfläche > Regional > Zeitzonen Region > Germany
# EZ > Benutzeroberfläche > Skins > Skin konfigurieren > Hauptmenüeinträge > (Kategorie Widgets aktivieren,Filme, Musik, TV, Addons, Bilder, Videos, Favoriten)
# alternativ: EZ > Benutzeroberfläche > Skins > Skin konfigurieren > Hauptmenüeinträge > abwählen: Musikvideos, Radio, Spiele , Wetter
# EZ > Benutzeroberfläche > Startup > Aktion beim Starten: TV sehen
# EZ > Benutzeroberfläche > Startup > Startfenster: TV-Kanäle
# EZ > System > Anzeige > Video kalibrieren > (mit Cursortasten und ok)
# EZ > System > Eingabe > Tastaturbelegungen > German
# EZ > Dienste > Allgemein > Gerätename > oerlie-xx-kodi
# EZ > PVR & TV > Allgemein > Kanalreihenfolge des Backend(s) verwenden  
#-----------------------------------------------------------------------
# Erforderliche Addons
#-----------------------------------------------------------------------
# EZ > Addons > Aus Repository installieren > Alle Repositories > Dienste > TvHeadend Server > Installieren
# EZ > Addons > Aus Repository installieren > Alle Repositories > PVR Clients > TvHeadend HTSP Client > Installieren
# für IPTV erforderlich
# EZ > Addons > Aus Repository installieren > Alle Repositories > Programm-Addons > FFmpeg-Tools > Installieren
#-----------------------------------------------------------------------
# Mediatheken instalieren
#-----------------------------------------------------------------------
# EZ > Addons > Aus Repository installieren > Alle Repositories > video > folgende installieren
#	3sat mediathek
#	ARD Mediathek
#	ARTE +7
#	BR Mediathek
#	Das Erste Mediathek
#	HR Mediathek
#	Kika mediathek
#	MDR Mediathek
#	Mediathek
#	Mediathekview
#	NDR Mediathek
#	ORF TVthek
#	Phoenix Mediathek
#	SR Mediathek
#	SRF Play TV
#	SWR Mediathek
#	Tagesschau
#	WDR Mediathek
#	Youtube
#	ZDF Mediathek 2016
#-----------------------------------------------------------------------
# Weitere interessante Addons
#-----------------------------------------------------------------------
# Addons > Aus Repository installieren > Alle Repositories > Dienste > Librespot > Installieren
# Addons > Aus Repository installieren > Alle Repositories > Musik-Addons > Radio > Installieren
# Addons > Musik-Addons > Radio > Nach Sender suchen ... 
# ...(Kontextmenü: Taste c, bzw. Symbol 3 Striche links oben im Cursir Quatranten) > Zu "Meine Sender" hinzufügen
#-----------------------------------------------------------------------
# Weitere Einstellungen
#-----------------------------------------------------------------------
# EZ > Medien > Allgemein > Löschen und Umbenennen von Dateien erlauben
# EZ > Medien > Videos > (Video Tags verwenden, Video-Informationen aus Dateien extrahieren, Thumbnails aus Viedeo-Dateien extrahieren)
# EZ > Medien > Bilder > Videodateien in Listen aufnehmen {Ausschalten, da die Videos im bilderbrowser oft nicht richtig wiedergegeben werden}
# {optional} EZ > LibreElec > Aktusaliserungen > Automatische Aktualisiserungen > manual {optional}
# {optional} EZ > LibreElec > Aktusaliserungen > (Update Kanal, verfügbare Versionen) {optional, erfordert neustart, bevor sichtbar}
# {optional} EZ > System > Eingabe > Periperiegeräte > CEC Adapter > {optional, ggf. Nummer des HDMi Ports einstellen]
# Addons > Programm Addons > LibreELEC Module Drivers > DVB Treiber Modul auswählen > {Abhängig von der verwendeten Hardware}
# DVB Treiber Module für Einplatinenrechner/USB-Dongle Kombinationen:
# 	Raspberry Pi und Geniatech T230 aka August T210 - LE Standard Teiber
# 	Raspberry Pi und Astrometa DVB-T2 - LE Standard Treiber
# 	Raspberry Pi und Freenet TV USB - nicht funktionsfähig
# 	Odroid-C2 und Geniatech T230 aka August T210 - DVB drivers for TBS
# 	Odroid-C2 und Astrometa DVB-T2 - nicht funktionsfähig
# 	Odroid-C2 und Freenet TV USB - nicht funktionsfähig
#-----------------------------------------------------------------------
# Ausgangskonfiguration für LibreELEC und Kodi ist abgeschlossen.
#-----------------------------------------------------------------------
# EZ > LibreElec > System > Sichern > System und Kodi Datensicherung erstellen > ok
#-----------------------------------------------------------------------
# Über "Ausschalter" auf dem Hauptbildschirm (links oben) und Neustart 
# Kodi neu starten.
# TV / Kanäle / Alle Kanäle - leerer Bildschirm erscheint
#-----------------------------------------------------------------------
