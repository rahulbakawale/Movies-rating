class Movie < ApplicationRecord
  def self.upcoming
   where("released_on >= ?",Time.now).order('released_on')
  end

  def self.past
    where("released_on < ?",Time.now).oder('released_on DESC')
   end 
end
