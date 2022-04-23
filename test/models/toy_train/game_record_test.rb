require "test_helper"

module ToyTrain
  class GameRecordTest < ActiveSupport::TestCase
    include ActiveJob::TestHelper

    setup do
      ToyTrain.max_attempts = 3
    end

    test "points are computed" do
      record = GameRecord.create(game_id: 1, user: users(:one), max_points: 30, units: 20)

      assert_equal 66.67, record.points
    end

    test "only max_attempts records of the same game per user are allowed" do
      3.times { GameRecord.create(game_id: 1, user: users(:one), max_points: 30, points: 20) }

      record = GameRecord.new(game_id: 1, user: users(:one), max_points: 30, points: 29)

      refute record.valid?
      refute_empty record.errors[:base]
    end

    test "the max_attempts'th record is valid" do
      2.times { GameRecord.create(game_id: 1, user: users(:one), max_points: 30, points: 20) }

      record = GameRecord.new(game_id: 1, user: users(:one), max_points: 30, points: 29)

      assert record.valid?
      assert_empty record.errors[:base]
    end

    test "creating a record enqueues a job" do
      assert_enqueued_with(job: UpdateRankingsJob) do
        GameRecord.create(game_id: 1, user: users(:one), max_points: 30, points: 20)
      end
    end

    test "destroying a record enqueues a job" do
      game_record = GameRecord.create(game_id: 1, user: users(:one), max_points: 30, points: 20)

      assert_enqueued_with(job: UpdateRankingsJob) do
        game_record.destroy
      end
    end
  end
end
