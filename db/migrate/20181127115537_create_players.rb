class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.integer :donation

      t.timestamps
    end
    add_index :players, :email, unique: true
  end
end
