class Movie < ApplicationRecord
  def self.upcoming
   where("released_on >= ? OR released_on IS NULL",Time.now).order('released_on')
  end

  def self.past
    where("released_on < ?",Time.now).order('released_on DESC')
   end 
end
