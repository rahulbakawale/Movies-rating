class Movie < ApplicationRecord


 has_many :reviews
  
   validates :title, :released_on, :duration, presence: true
   
   validates :description , length: { minimum: 25 }

   validates :movie_image, format: { with: /\w+\.(jpeg|png)\z/i,
    message: "must be a JPG or PNG image " }

   validates_numericality_of :total_gross, :only_integer => true, :greater_than_or_equal_to => 0
   


    #RATINGS = {1=>'G', 2=>'PG' ,3=>'PG-13',4=>'R',5=>'NC-17'}
   RATINGS = %w(G PG PG-13 R NC-17)

  def self.upcoming
   where("released_on >= ? OR released_on IS NULL",Time.now).order('released_on')
  end

  def self.past
    where("released_on < ?",Time.now).order('released_on DESC')
   end 


   
  def sold_out?
      
    avaivility = spot - reviews.persisted_records.count
    avaivility.zero? || avaivility < 0
  end
  

end

 