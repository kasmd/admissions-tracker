# == Schema Information
#
# Table name: surveys
#
#  id        :integer          not null, primary key
#  interview :string
#

class Survey < ActiveRecord::Base
	belongs_to :submission
	has_many :questions
	# QUESTION Is this needed? Kelly D
	# has_and_belongs_to_many :answers 
	# has_many :submissions, through: :answers
end
