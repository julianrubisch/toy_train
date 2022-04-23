module ToyTrain
  class OverallRankingPosition < ApplicationRecord
    belongs_to :rankable, polymorphic: true

    validates :position, uniqueness: true
    validates :rankable_id, uniqueness: {scope: :rankable_type}
  end
end
