class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.boolean :present, default: true, null: false
      t.integer :action_points, default: 0, null: false
      t.float :pace, default: 1.0, null: false

      t.timestamps
    end
  end
end
