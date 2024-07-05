# FfcrmAttachments

A plugin for Fat Free CRM that provides the ability to add one or many attachments (of any type) to entities in CRM.
## Installation / Getting started

_Pre-requisites: you'll need to have a Fat Free CRM instance up and running._

* Add ```ffcrm_attachments``` to your Fat Free CRM Gemfile and run ```bundle install```
```ruby
gem 'ffcrm_attachments', github: 'crossroads/ffcrm_attachments', branch: 'master'
```

* Then migrate your database to get the new Attachments table
```ruby
bundle exec rake db:migrate
```

* Add default settings for attachments as: (In your config/settings.default.yml)
```ruby
:attachment_size: '5 MB'
```

* Start your Fat Free CRM server and edit a contact/account etc... You should be able to attach multiple files and download them.

## TODO / NOT YET IMPLEMENTED

<!-- * Implement maximum file upload size validation -->
* Virus validation
* Add javascript to provide 'drag and drop' file capability when editting an entity
* Implement security for the File class - it should be able to do whatever the parent class allows. (I.e. if you are allowed to see a contact, then you are allowed to download the attached file.)

## Local development

If you'd like to develop this gem locally, it's worth knowing about the ```bundler config.local``` command. This will use your local copy of the gem (if it exists) when you are on your local machine but selects the github version when the code is running on your server.

* Clone ffcrm_attachment from github
```ruby
git clone https://github.com/crossroads/ffcrm_attachments.git
```
* And setup bunlder to use it:
```ruby
bundle config local.ffcrm_attachments /path/to/ffcrm_attachments
```

Read more at http://ryanbigg.com/2013/08/bundler-local-paths/ and http://bundler.io/v1.3/git.html

Note: you will need a recent version of bundler to do this.

## Tests

Run ```rake``` to setup the database and run the specs.

## Bug Fixes / Contributions

Please open issues in the GitHub issue tracker and use pull requests for new features.

## Conversion from PaperClip to ActiveStorage

Please run this in the Rails console
```
require "ffcrm_attachments/convert_to_active_storage"
FfcrmAttachments::ConvertToActiveStorage.new.process!
```

## License

Copyright Crossroads Foundation 2014

This is "Charityware" i.e. you can use and copy it as much as you like,
but you are encouraged to make a donation for those in need via the
Crossroads Foundation (the organisation who built this plugin). See http://www.crossroads.org.hk/

## Authors / Credits

This plugin was developed during the 'Rails Guns - Crossroads Charity Hackathon' event (Dec 2013) and we gratefully acknowledge work from the following 'rails guns':

* Steve Kenworthy (@steveyken) - developer @ Crossroads Foundation
* Simon Pang (@simonpang)
* Swati Jadhav (@swatijadhav)

