module ToyTrain
  class GameRecord < ApplicationRecord
    before_save :calculate_points
    after_save :calculate_ranking
    after_destroy_commit :calculate_ranking

    validate do |record|
      errors.add(:base, "Only three attempts per game are allowed") if ToyTrain::GameRecord.where(user: record.user, game_id: record.game_id).count >= ToyTrain.max_attempts
    end

    belongs_to :user, class_name: ToyTrain.user_class

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :game, class_name: "ToyTrain::Game"

    def calculate_points
      self.points = (units.to_f * 100 / max_points).round(2)
    end

    def calculate_ranking
      UpdateRankingsJob.perform_later(game_id: game_id)
    end

    def data=(value)
      super(JSON.parse(value))
    end

    def to_json
      serializable_hash(only: %i[points max_points time max_time data]).map { |k, v| [k.camelize(:lower), v] }.to_h.to_json
    end
  end
end
