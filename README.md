# README

The application will allow users to upload contact files in CSV format and process them in order
to generate a unified contact file. The contacts must be associated with the user who imported
them into the platform. When uploading the files, the application must validate that the fields
entered are correctly formatted. You must take into account that the files can have many
records.

more info check the Contact_Importer_Assignment_-_Backend_.pdf in the root

Things you may want to cover:

* Ruby version

  ruby 2.7.1
  Rails 6.0.4.4
  sqlite3

* System dependencies

  For the background jobs the application depends on sidekiq and redis, please
  make sure you have a redis server up and running, please do not forget to set
  the envrioment variable SIDEKIQ_REDIS_SERVER_URL

    * export SIDEKIQ_REDIS_SERVER_URL="redis://redis_server_url" or
    * please edit you .bashrc and add at the end export SIDEKIQ_REDIS_SERVER_URL="redis://redis_server_url"

* How to run the test suite

  The testing suite used for the project was rspec, with rspec-rails, shoulda-matchers
  rails-controller-testing and factory_bot_rails

  For Testing:

     1. models: rspec spec/models
     2. request: rspec spec/requests/contacts_spec.rb
     3. import csv library: spec/helpers/import_contact_cvs

  NOTE: the files used for the testing are located at spec/helpers/import_contact_cvs

* Services (job queues, cache servers, search engines, etc.)

  The ImportsContactsJob will import the contacts from the files uploaded by the user
  please make sure you have a redis server up and running, and set the
  SIDEKIQ_REDIS_SERVER_URL as described in System dependencies

* Deployment instructions

  After cloning the project

  1. do bundle install
  2. do rails db:create && rails db:migrate
  3. rails credentials:edit
  4. yarn

  For being able to cipher the CC numbers please create the following
  credentials in you credentials files

  1. Go to the terminal and open a rails c
  2. copy and paste Lockbox.generate_key
  3. Open the rails credentials with you favorite editor/

      EDITOR="nano --wait" bin/rails credentials:edit

  4. Paste the generated key as shown at the bottom

    lockbox:
      master_key: "00000000000000000000000000000000000000000000000000000000000"

  5. save and close the file

* Start the app

  1. in you terminal start the rails server with rails s.
  2. in the navigator go to localhost:3000.
  3. There is a default user email: 'user@test.com', password: '123456789'.
  4. if you want to create new users you can sign-up in the link bellow login button.
  5. After login in, the app will route you to contacts, you can upload files
     clicking the Upload Contacts button at the top right.
