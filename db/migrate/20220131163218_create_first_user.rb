class CreateFirstUser < ActiveRecord::Migration[6.0]
  User.create(email: 'user@test.com', password: '123456789')
end
