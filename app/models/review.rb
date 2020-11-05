class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  #validate :check_spot_for_movie
 
  scope :persisted_records, -> { where("id IS NOT NULL") }
 
   validates  :stars, :comment, presence: true

   #validates :name, confirmation: { case_sensitive: true }

   #validates :name, exclusion: { in: %w(raja rahul ram),
     # message: "%{value} is reserved." }
  


    #Stars = %w(s1 s2 s3 s4 s5 s6 s7 s8 s9 s10)
 



  def stars_as_parcent
    (stars/5.0)*100.0
  end


 

  def persisted_records
    where "id IS NOT NULL"
  end


  private 

  def check_spot_for_movie
    if movie.sold_out?
        errors.add(:base, 'No More Review.')
      end
  end

end
