require "test_helper"

module ToyTrain
  class OverallRankingPositionTest < ActiveSupport::TestCase
    test "the ranking position has to be unique" do
      OverallRankingPosition.create(rankable: users(:one), position: 37, score: 100.0)

      second_ranking = OverallRankingPosition.new(rankable: users(:two), position: 37, score: 80.0)

      refute second_ranking.valid?
    end

    test "the rankable has to be unique per game" do
      user = users(:one)
      team = teams(:one)

      assert user.id == team.id

      OverallRankingPosition.create(rankable: user, position: 37, score: 70.0)

      second_ranking = OverallRankingPosition.new(rankable: user, position: 39, score: 80.0)

      refute second_ranking.valid?

      third_ranking = GameRankingPosition.new(rankable: team, position: 39, score: 75.0)

      assert third_ranking.valid?
    end
  end
end
