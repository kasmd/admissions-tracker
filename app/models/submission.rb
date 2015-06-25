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
	has_one :phonescreen
	has_one :interview

	def save_attachment(attachment)
		
	end
	
	def phone_change_status
		binding.pry
		scores = self.phonescreen
		total = scores.q1.to_i + scores.q2.to_i + scores.q2.to_i + scores.q3.to_i + scores.q4.to_i + scores.q5.to_i
		if total > 13
			binding.pry
			self.status = "pending-in-person"
			self.save
			binding.pry
		else
			self.status = "rejected"
		end
	end

end
