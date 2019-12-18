class Review < ApplicationRecord
  belongs_to :movie

  #validate :check_spot_for_movie
 
  scope :persisted_records, -> { where("id IS NOT NULL") }


  def persisted_records
    where "id IS NOT NULL"
  end


  private 

 # def check_spot_for_movie
 #   if movie.sold_out?
 #       errors.add(:base, 'No More Review.')
 #     end
 # end

end
