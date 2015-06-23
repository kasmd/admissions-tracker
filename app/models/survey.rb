class Survey < ActiveRecord::Base
	has_many :questions
	has_and_belongs_to_many :answers
	has_many :submissions, through: :answers
end