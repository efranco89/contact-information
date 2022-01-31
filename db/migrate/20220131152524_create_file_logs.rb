class CreateFileLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :file_logs do |t|
      t.string :status
      t.bigint :user_id
      t.text :message
      t.text :file_name

      t.timestamps
    end
  end
end
