class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.string :name, null: false
      t.text :how_to
      t.integer :user_id

      t.timestamps
    end
  end
end
