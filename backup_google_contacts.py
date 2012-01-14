#! /usr/bin/python
 
## This script backs up my google contacts
## http://www.joet3ch.com/2008/09/25/backup-google-contacts/
 
import gdata.contacts.service
gd_client = gdata.contacts.service.ContactsService()
gd_client.ClientLogin('uname@domain.com', 'password')
query = gdata.contacts.service.ContactsQuery()
query.max_results = 2000 # change for max contacts returned
feed = gd_client.GetContactsFeed(query.ToUri())
print feed
