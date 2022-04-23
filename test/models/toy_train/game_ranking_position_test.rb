require "test_helper"

module ToyTrain
  class GameRankingPositionTest < ActiveSupport::TestCase
    test "the ranking position has to be unique per game" do
      GameRankingPosition.create(game_id: 1, rankable: users(:one), position: 37, score: 100.0)

      second_ranking = GameRankingPosition.new(game_id: 1, rankable: users(:two), position: 37, score: 80.0)

      refute second_ranking.valid?
    end

    test "the rankable has to be unique per game" do
      user = users(:one)
      team = teams(:one)

      assert user.id == team.id

      GameRankingPosition.create(game_id: 1, rankable: user, position: 37, score: 100.0)

      second_ranking = GameRankingPosition.new(game_id: 1, rankable: user, position: 39, score: 75.0)

      refute second_ranking.valid?

      third_ranking = GameRankingPosition.new(game_id: 1, rankable: team, position: 39, score: 75.0)

      assert third_ranking.valid?
    end

    # test "returns the change direction" do
    #   GameRankingPosition.destroy_all

    #   ranking = GameRankingPosition.create(game_id: 1, rankable: users(:one), position: 37)
    #   ranking.update(position: 36)

    #   assert_equal :up, ranking.trend

    #   ranking.touch
    #   ranking.update(position: 36)

    #   assert_equal :right, ranking.trend

    #   ranking.update(position: 37)

    #   assert_equal :down, ranking.trend
    # end
  end
end
