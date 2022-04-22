class CreateToyTrainGameRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :toy_train_game_records do |t|
      t.integer :max_points, default: 100
      t.jsonb :data
      t.float :max_time, default: 0.0
      t.float :points
      t.float :time, default: 0.0
      t.integer :units
      t.integer :game_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
