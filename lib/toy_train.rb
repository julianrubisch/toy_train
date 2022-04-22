require "active_hash"

require "toy_train/version"
require "toy_train/engine"

module ToyTrain
  mattr_accessor :user_class, default: "User"
  mattr_accessor :games, default: []
  mattr_accessor :max_attempts, default: 1

  def self.configure
    yield self
  end
end
