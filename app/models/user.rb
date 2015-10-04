class User < ActiveRecord::Base
  def go_down
    self.update(rank: self.rank -= 1)
  end

  def go_up
    self.update(rank: self.rank += 1)
  end
end
