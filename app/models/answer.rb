# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  submission_id :integer
#  question_id   :integer
#  body          :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Answer < ActiveRecord::Base
	has_and_belongs_to_many :surveys
	belongs_to :submission
end
