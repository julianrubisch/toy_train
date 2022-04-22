module ToyTrain
  class Game < ActiveHash::Base
    self.data = ToyTrain.games
  end
end
