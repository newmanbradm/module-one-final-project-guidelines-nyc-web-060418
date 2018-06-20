class Visit < ActiveRecord::Base

  belongs_to :traveller
  belongs_to :attraction

  def self.add_visit(traveller, attraction, date)
    Visit.create(traveller: traveller, attraction: attraction, date: date)
  end



end
