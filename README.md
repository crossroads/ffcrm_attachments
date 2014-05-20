# FfcrmAttachments

A plugin for Fat Free CRM that provides the ability to add one or many attachments (of any type) to entities in CRM. 
## Installation / Getting started

_Pre-requisites: you'll need to have a Fat Free CRM instance up and running._

* Add ```ffcrm_attachments``` to your Fat Free CRM Gemfile and run ```bundle install```.

```gem 'ffcrm_attachments', github: 'crossroads/ffcrm_attachments', branch: 'master'```

* Start your Fat Free CRM server and edit a contact/account etc... You should be able to attach multiple files and download them.

## TODO

*Please note the code that the code is yet been written - this is a specification!*

* Write the UI code that will display when the entity is being editting - it should allow multiple files to be uploaded to the contact.
* Write the UI code that will display files attached to the entity.
* Write some rspecs for File class - suggest using ```factory_girl```)
* Implement security for the File class - it should be able to do whatever the parent class allows. (I.e. if you are allowed to see a contact, then you are allowed to download the attached file.)
* Add javascript to provide 'drag and drop' file capability when editting an entity

## DONE

*This is the stuff that has been done already*

* This plugin should require and use the ```paperclip``` gem. (See https://github.com/thoughtbot/paperclip)
* Write a polymorphic file class that implements the paperclip method ```has_attached_file``` (see examples in https://github.com/fatfreecrm/fat_free_crm/tree/master/app/models/polymorphic)
* Write some engine code in the plugin to add the File class to entities (Accounts/Contacts/Campaigns/Opportunities/Tasks) via a has_many relationship when the engine is initialized (Tip: create a ```to_prepare``` block in https://github.com/crossroads/ffcrm_attachments/blob/master/lib/ffcrm_attachments/engine.rb)

## Local development

If you'd like to develop this gem locally, it's worth knowing about the ```bundler config.local``` command. This will use your local copy of the gem (if it exists) when you are on your local machine but selects the github version when the code is running on your server.

* Clone ffcrm_attachment from github ```git clone https://github.com/crossroads/ffcrm_attachments.git```
* And setup bunlder to use it: ```bundle config local.ffcrm_attachments /path/to/ffcrm_attachments```

Read more at http://ryanbigg.com/2013/08/bundler-local-paths/ and http://bundler.io/v1.3/git.html

Note: you will need a recent version of bundler to do this.

## Tests

Run ```rake``` to setup the database and run the specs.

## Bug Fixes / Contributions

Please open issues in the GitHub issue tracker and use pull requests for new features.

## License

Copyright Crossroads Foundation 2013

This is "Charityware" i.e. you can use and copy it as much as you like,
but you are encouraged to make a donation for those in need via the
Crossroads Foundation (the organisation who built this plugin). See http://www.crossroads.org.hk/

## Authors / Credits

This plugin was developed during the 'Rails Guns - Crossroads Charity Hackathon' event (Dec 2013) and we gratefully acknowledge work from the following 'rails guns':

* Steve Kenworthy (steveyken(at)gmail.com) - developer @ Crossroads Foundation
* ...
