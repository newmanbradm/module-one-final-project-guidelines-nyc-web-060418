class Review < ActiveRecord::Base

  belongs_to :traveller
  belongs_to :attraction

end
