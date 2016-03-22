class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :users
      t.string 'name'
      t.string 'description'
      t.decimal 'current_bid'

      t.timestamps null: false
    end
  end
end
