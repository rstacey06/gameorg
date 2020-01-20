class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :name
      t.text :console
      t.integer :user_id 

      t.timestamps null: false
    end
  end
end
