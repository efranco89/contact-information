class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :birthday
      t.string :phone
      t.string :address
      t.string :credit_card_ciphertext
      t.string :franchise
      t.string :email
      t.bigint :user_id

      t.timestamps
    end
  end
end
