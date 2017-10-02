#!/bin/bash

################################################
# Get a tar backup from a remote host
# Run this on your backup server to get a backup file that is named and done.
################################################

# maskinen som backup sker på
sourceuser="mainserveruser"
# user och host är uppdelat för att skapa backupnamn
sourcehostname="mainserverhostname" 
backup_files="/fil1 /fil2 /en/annan/viktig/fil"

# Maskinen som backupen skall till
targetuser="backupuser"
targethostname="backupserver"
backup_destination="/vart/den/hamnar"


# andra variabler
# vart skickas errormail?
#errormail ="din@mail.se"

# Namnet på backupen kommer bli HH:MM_dd-mm-YYYY-sourcehostname.tar med det som står här"
backuptime=$(date +"%H:%M_%d-%m-%Y")
backupname="$sourcehostname-$backuptime.tar"

# namnet på logfilen
logname="errorlog_$sourcehostname_$backuptime.txt"
# Här står det vad som kommer skickas i errormailets body
errormessage="A problem occured while backing up @sourcehostname. A text file has been attached to debug the problem. The file is also kept on $sourcehostname with the name $logname"

# scriptet
# man skulle kunna använda scp för att flytta från en remote host till en annan direkt om det skulle vara smidigare

ssh $user@$sourcehostname 'script log.txt; (tar -zcvf $backupname $backup_files && scp $backupname $targetuser@targethostname:$backup_destination && rm -f $backupname) || (exit; sendmail /a $logname $errormail "Backup error" "$errormessage"); exit'
