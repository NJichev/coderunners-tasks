class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 'first_name'
      t.string 'last_name'
      t.string 'email'
      t.string 'address'
      t.string 'phone_address'
      t.string 'password_digest'

      t.timestamps null: false
    end
  end
end