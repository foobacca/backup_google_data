#! /bin/bash
 
## This script backs up my calendars -- will use with Cron to backup daily.
## following is adapted from http://permanentinkdesign.com/articles/backing-up-a-google-calendar/
INCREMENT=`date +%Y%m%d%H%M`
DIR="$HOME/Documents/Backup_Google"
USERNAME="uname@domain.com"
PASSWORD="mypassword"
## Vinh's calendar
curl -s url-to-private-ics -o "$DIR/Vinh_$INCREMENT.ics"
## TNTTSP's calendar'
curl -s url-to-private-ics -o "$DIR/TNTTSP_$INCREMENT.ics"
## Birthdays
curl -s url-to-private-ics -o "$DIR/Birthdays_$INCREMENT.ics"
 
## Now backup Google Contacts
## http://www.joet3ch.com/2008/09/25/backup-google-contacts/
$HOME/Documents/bin/Backup_Google_Contacts.py > ${DIR}/VinhContacts_$INCREMENT.xml
 
## Now backup Google Reader subscriptions
## http://www.clausconrad.com/blog/backup-google-reader-subscription-list-to-opml-automatically
$HOME/Documents/bin/gr-opml-backup.py $USERNAME $PASSWORD > Vinh_GoogleReaderSubs_$INCREMENT.opml
 
find $DIR -mtime +14 -exec rm -f {} \;
