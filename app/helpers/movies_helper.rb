module MoviesHelper

  def time_date(date)
    return  date.strftime('%d/%B/%Y : %H:%M %p') if date
     "Coming Soon"
  end

   def number_change(num)
    return number_to_currency(num)
   end

  

end
