# == Schema Information
#
# Table name: questions
#
#  id        :integer          not null, primary key
#  survey_id :integer
#  body      :string
#

class Question < ActiveRecord::Base
	has_many :answers
	belongs_to :survey
	
end
