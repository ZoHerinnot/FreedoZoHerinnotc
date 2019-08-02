class Speciality < ApplicationRecord
  has_many :occupations
	has_many :doctors , through: :occupation 

end
