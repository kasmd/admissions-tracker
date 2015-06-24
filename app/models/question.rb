# == Schema Information
#
# Table name: questions
#
#  id        :integer          not null, primary key
#  survey_id :integer
#  body      :string
#

class Question < ActiveRecord::Base
	belongs_to :survey
	has_many :answers
end
