#!/bin/zsh

adt=./AIRSDK_MacOS/bin/adt
amxmlc=./AIRSDK_MacOS/bin/amxmlc
password=s3cret
$amxmlc src/Main.as -debug=true -use-network=false -output=bin/FilePermissionChecker.swf
cp Main-app.xml bin/Main-app.xml
$adt -certificate -cn Test -ou TestOrgUnit -o TestOrgName -c PL -validityPeriod 2 2048-RSA cert.p12 $password
$adt -package -storetype pkcs12 -keystore cert.p12 -storepass $password -tsa none -target air bin/PermissionChecker.air Main-app.xml -C bin FilePermissionChecker.swf -C bin Main-app.xml
