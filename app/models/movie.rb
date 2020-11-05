class Movie < ApplicationRecord

 has_many :likes, dependent: :destroy
 
 # has_many :users, through: :likes (if use this line so moviecontroller change in show action users remmember that)
 has_many :likers, through: :likes, source: :user

  has_many :movies_categores, dependent: :destroy
  has_many :categories, through: :movies_categores

  has_many :reviews, dependent: :destroy

 
  
   validates :title, :duration, presence: true
   
   validates :description , length: { minimum: 25 }

   validates :movie_image, format: { with: /\w+\.(jpeg|png)\z/i,
    message: "must be a JPG or PNG image " }

   validates_numericality_of :total_gross, :only_integer => true, :greater_than_or_equal_to => 0
   
   
    scope :upcoming, -> {where("released_on >= ? OR released_on IS NULL",Time.now).order('released_on')}
    scope :past , -> {where("released_on < ? ",Time.now).order ("released_on DESC")}
    scope :recent, -> (max=3) {past.limit(max)}


    RATINGS = %w(G PG PG-13 R NC-17)
   before_save :assing_value_slug 


  #def self.upcoming
  # where("released_on >= ? OR released_on IS NULL",Time.now).order('released_on')
  #end

#  def self.past
#    where("released_on < ?",Time.now).order('released_on DESC')
#   end 

  def assing_value_slug
   self.slug="-#{title.parameterize}"
   #self.save
  end

  def to_param
   "#{slug}"
  end
       
  def sold_out?
   avaivility = spot - reviews.persisted_records.count
    avaivility.zero? || avaivility < 0
  end
  

end

 