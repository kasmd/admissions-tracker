class Student < User
	has_many :submissions
	has_many :courses, through: :submissions
end