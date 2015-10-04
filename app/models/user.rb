class User < ActiveRecord::Base
  def rank_up
    self.update(rank: self.rank -= 1)
  end

  def rank_down
    self.update(rank: self.rank += 1)
  end
end
