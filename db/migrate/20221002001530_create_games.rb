class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.string :name

      t.timestamps
    end
  end
end
