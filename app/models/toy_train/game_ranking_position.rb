module ToyTrain
  class GameRankingPosition < ApplicationRecord
    belongs_to :rankable, polymorphic: true

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :game, class_name: "ToyTrain::Game"

    validates :position, uniqueness: {scope: :game_id}
    validates :game_id, uniqueness: {scope: [:rankable_id, :rankable_type]}
  end
end
