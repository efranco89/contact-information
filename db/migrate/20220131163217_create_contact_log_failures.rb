class CreateContactLogFailures < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_log_failures do |t|
      t.text :data
      t.text :error
      t.string :error_line
      t.bigint :user_id
      t.bigint :file_log_id

      t.timestamps
    end
  end
end
