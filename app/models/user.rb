class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  

  has_many :likes, dependent: :destroy
  has_many :movies, through: :likes

   

  has_secure_password

  validates :name, :email, :password , presence: true
   
   validates :password, length: { in: 6..20 }

    validates :email, uniqueness: true

   before_save :assing_value_slug 

   def assing_value_slug
   self.slug="#{id}-#{name.parameterize}"
   #self.save
  end

  def to_param
   "#{slug}"
  end

end
