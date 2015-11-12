class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.integer :author_id
      t.integer :owner_id
      t.boolean :open
      t.boolean :use
      t.datetime :create_on
      t.datetime :update_on
      t.datetime :closed_on
    end
  end
end
