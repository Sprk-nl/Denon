#!/bin/bash
# A file for Domoticz to check if the Denon receiver and a virtual switch have the correct state.
# Run this script in cron every minute.

switchID=[SWITCH-ID]
domoticzIP=[IP-ADDRESS]
denonIP=[IP-ADDRESS]

  DENONPOWER=`curl -s http://$denonIP/goform/formMainZone_MainZoneXml.xml | grep -oP '(?<=<Power><value>).*(?=</value)'`
  echo Denon status is $DENONPOWER

  SWITCHSTATUS=`curl -s "http://$domoticzIP:8080/json.htm?type=devices&rid=$switchID" | grep -oP '(?<="Status" : ").*(?=",)'`
  echo Switch $switch status is $SWITCHSTATUS


   if [ "$SWITCHSTATUS" == "Off" ] && [ "$DENONPOWER" == "STANDBY" ]
    then
     echo Switchstatus and Receiver are off, Skip sending command to Domoticz;
   elif [ "$SWITCHSTATUS" == "On" ] && [ "$DENONPOWER" == "ON" ]
    then
     echo Switchstatus and Receiver are on, Skip sending command to Domoticz;
   elif [ "$SWITCHSTATUS" == "Off" ] && [ "$DENONPOWER" == "ON" ]
    then
     echo Switchstatus is Off, Denon is ON, updating Switch $switch;
     curl -s "http://$domoticzIP:8080/json.htm?type=command&param=switchlight&idx=$switchID&switchcmd=On" > /dev/null
   elif [ "$SWITCHSTATUS" == "On" ] && [ "$DENONPOWER" == "STANDBY" ]
    then
     echo Switchstatus is On, Denon is OFF, updating Switch $switch;
     curl -s "http://$domoticzIP:8080/json.htm?type=command&param=switchlight&idx=$switchID&switchcmd=Off" > /dev/null
fi
