# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

  For being able to cipher the CC numbers please create the following
  credentials in you credentials files

  1. Go to the terminal and open a rails c
  2. copy and paste Lockbox.generate_key
  3. Open the rails credentials with you favorite editor/

      EDITOR="nano --wait" bin/rails credentials:edit

  4. Paste the generated key as shown

    lockbox:
      master_key: "00000000000000000000000000000000000000000000000000000000000"

* ...
