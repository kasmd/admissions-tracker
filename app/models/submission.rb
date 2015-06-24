# == Schema Information
#
# Table name: submissions
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  course_id     :integer
#  status        :string
#  instructor_id :integer
#  officer_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Submission < ActiveRecord::Base
	belongs_to :student
	belongs_to :instructor
	belongs_to :officer
	belongs_to :course
	has_many :answers
	has_many :surveys, through: :answers

	# has_attached_file :file

end
