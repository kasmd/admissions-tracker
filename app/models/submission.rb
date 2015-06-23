class Submission < ActiveRecord::Base
	belongs_to :student
	belongs_to :instructor
	belongs_to :officer
	belongs_to :course
	has_many :answers
	has_many :surveys, through: :answers
end