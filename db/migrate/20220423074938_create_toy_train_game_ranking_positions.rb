class CreateToyTrainGameRankingPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :toy_train_game_ranking_positions do |t|
      t.references :rankable, polymorphic: true, null: false
      t.integer :position, null: false
      t.float :score, null: false
      t.integer :game_id, null: false

      t.timestamps
    end
  end
end
