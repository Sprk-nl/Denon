# Denon

A Denon 3310 for example can be controlled via serial, telnet or http requests.

Through telnet you can only send one command at a time.
telnet connect, send command, telnet disconnect, and again and again :(
There are a lot of pdf's available, which explain the denon protocol in depth.

The different types of receivers also have different commands, sometimes also for the same functionalities.


HTTP example:
http://192.168.0.120/goform/formMainZone_MainZoneXml.xml

volume up:
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutMasterVolumeBtn/>

volume down:
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutMasterVolumeBtn/<

set volume at 35 (-45=35-80):
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutMasterVolumeSet/-45.0

volume mute:
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutVolumeMute/off
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutVolumeMute/on

Inputs:
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutZone_InputFunction%2FSAT%2FCBL
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutZone_InputFunction%2FMPLAY
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutZone_InputFunction%2FDVD

DRC:
http://192.168.0.120/SETUP/AUDIO/s_surrpara_1.asp?listDynamicComp=Mid

Power:
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutZone_OnOff%2FON
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutZone_OnOff%2FOFF
http://192.168.0.120/MainZone/index.put.asp?cmd0=PutSystem_OnStandby%2FSTANDBY
