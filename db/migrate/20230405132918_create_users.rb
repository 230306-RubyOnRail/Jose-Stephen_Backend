class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :password_digest
      t.boolean :role
      t.string :email

      t.timestamps
    end
  end
end
