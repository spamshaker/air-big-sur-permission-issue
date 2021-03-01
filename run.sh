#!/bin/zsh

adl=AIRSDK_MacOS/bin/adl
amxmlc=./AIRSDK_MacOS/bin/amxmlc

$amxmlc src/Main.as -debug=true -use-network=true -output=bin/FilePermissionChecker.swf
$adl -profile extendedDesktop Main-app.xml ./bin
