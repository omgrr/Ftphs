class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate :_rank_above_25, :_rank_below_1

  def go_down
    self.update(rank: self.rank -= 1)
  end

  def go_up
    self.update(rank: self.rank += 1)
  end

  def _rank_above_25
    errors.add(:rank, "cannot go above 25") if self.rank >= 26
  end

  def _rank_below_1
    errors.add(:rank, "cannot go below 1") if self.rank < 1
  end
end
